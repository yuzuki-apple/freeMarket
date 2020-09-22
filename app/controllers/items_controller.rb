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
    @item.destroy if @item.user_id == current_user.id
      redirect_to root_path
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
end
