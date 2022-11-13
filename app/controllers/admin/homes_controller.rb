class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    @order_items = Order_item.all
  end
end
