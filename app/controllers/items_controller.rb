class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def destroy
    if @item.user_id == current_user.id && @item.destroy 
      redirect_to root_path
    end
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
end
