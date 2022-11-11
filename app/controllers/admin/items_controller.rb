class Admin::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
   @item = Item.find(params[:id])
  end

  def edit
    
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

private

  def item_params
    params.require(:item).permit(:item_image,:name,:introduction,:price,:genre_id,:is_active)
  end

end
