class Public::CartItemsController < ApplicationController
  
  def index
    @customer = current_customer
    @cart_items = @customer.cart_items
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    customer = current_customer
    cart_items = customer.cart_items
    cart_items.destroy
    redirect_to cart_items_path
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
  
end
