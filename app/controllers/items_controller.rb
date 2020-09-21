class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end
end
