class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end
  
  def new
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def create
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def show
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def edit
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def update
    @genres = Genre.all
    @genre = Genre.new
  end
  
private

  def item_params
    params.require(:item).permit(:name,:introduction,:price)
  end

end
