class Public::OrderController < ApplicationController
  
  def new
    @customer = current_customer
    @order = Order.new
    @address = @customer.addresses.all
    
  end
  
  def confirm
    @customer = current_customer
    @order = Order.new(order_params)
    @cart_item = @customer.cart_items.all
  end
  
  def complete
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
  end
  
  def index
  end
  
  def show
  end
  
  private
  
  def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :billing, :billing_method)
  end
  
  
end
