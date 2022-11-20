class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.order(created_at: :desc).page(params[:page]).per(8)
    
    @count = Item.count
  end
  
  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
  
  
end
