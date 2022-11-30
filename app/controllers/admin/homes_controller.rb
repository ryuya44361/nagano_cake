class Admin::HomesController < ApplicationController

  def top
    @orders = Order.page(params[:page])
    @order = Order.find(@orders.id)
    @order_items = @order.order_items
    @total = @order_items.inject(0) { |sum, order_item| sum + order_item.amount }
  end
end
