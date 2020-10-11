class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

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
    @images = @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.valid? && @item.save!
      redirect_to root_path controller: :items, action: :index
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
    if @item.user_id == current_user.id && @item.destroy 
      redirect_to root_path
    end
  end
  
  def buy
  end

  private
  def item_params
    params.require(:item).permit(:images, :name, :description, :category, :condition, :shipment_fee_id, :shipment_region_id, :shipment_schedule_id, :price, [images_attributes: [:src]]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

