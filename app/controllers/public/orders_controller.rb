class Public::OrdersController < ApplicationController
  
  def new
    @customer = current_customer
    @order = Order.new
    @address = @customer.addresses.all
    
  end
  
  def confirm
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
    
    if params[:order][:address_select] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
      
    elsif params[:order][:address_select] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
  end
  
  def complete
  end
  
  def create
    cart_items = current_customer.cart_items.all
    
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
      
      cart_items.each do |cart|
        order_item = OrderItem.new
        order_item.item_id = cart.item_id
        order_item.order_id = @order.id
        order_item.purchase_amount = (cart.item.price * 1.1).floor
        order_item.amount = cart.amount
        order_item.create_status = 0
        order_item.save
      end
      
      cart_items.destroy_all
      redirect_to complete_orders_path
  end
  
  def index
    @orders = current_customer.orders
  end
  
  def show
    @order = Order.find(params[:id])
    
  end
  
  private
  
  def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :billing, :billing_method, :notes_status)
  end
  
end
