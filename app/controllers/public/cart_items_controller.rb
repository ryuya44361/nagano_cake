class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = current_customer
    @cart_items = @customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
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
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @customer = current_customer
    @cart_items = @customer.cart_items

    if cart_item = @cart_items.find_by(item_id: @cart_item.item_id.to_i)
      amount = cart_item.amount + @cart_item.amount
      cart_item.update(amount: amount)
    else
      @cart_item.customer_id = current_customer.id
      @cart_item.save
      
    end

    redirect_to cart_items_path
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
