class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    order = @order_item.order
    @order_items = order.order_items.all
    @order_item.update(order_item_params)

    if @order_items.where(create_status: OrderItem.create_statuses.key(2)).exists?
      order.update(notes_status: Order.notes_statuses.key(2))
    elsif @order_items.count == @order_items.where(create_status: OrderItem.create_statuses.key(3)).count
      order.update(notes_status: Order.notes_statuses.key(3))
    end

    redirect_to admin_order_path(@order_item.order_id)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:create_status)
  end

end
