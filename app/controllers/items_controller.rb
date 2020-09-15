class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.includes(:images).order('created_at DESC')
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
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
