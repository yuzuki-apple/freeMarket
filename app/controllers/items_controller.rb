class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order('created_at DESC')
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
