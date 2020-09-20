class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      item.destroy
      redirect_to root_path
    end
  end
end
