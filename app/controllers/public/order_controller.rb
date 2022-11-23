class Public::OrderController < ApplicationController
  
  def new
    @order = Order.new
    @customer = current_customer
    @address = @customer.addresses
  end
  
  def confirm
  end
  
  def complete
  end
  
  def create
    @order = Order.new(order_params)
    @customer.customer_id = current_customer.id
    @order.save
  end
  
  def index
  end
  
  def show
  end
  
  private
  
  def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :billing, :billing_method, :notes_status)
  end
  
end
