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
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.images.new
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
  end
  
  def buy
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category, :condition, :shipment_fee, :shipment_region, :shipment_schedule, :price, images_attributes: [:src]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
