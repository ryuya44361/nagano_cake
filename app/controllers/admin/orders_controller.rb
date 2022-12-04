class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
  end
  
  def update
    @order = Order.find(params[:id])
    order_items = @order.order_items
    @order.update(order_params)
    
    if @order.notes_status == Order.notes_statuses.key(1)
      
      order_items.each do |order_item|
        order_item.update(create_status: OrderItem.create_statuses.key(1))
      end
      
    end
    
    redirect_to admin_order_path(@order.id)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:notes_status)
  end
  
end
