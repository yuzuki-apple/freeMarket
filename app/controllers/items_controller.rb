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
    render "new"
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def buy
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category, :condition, :shipment_fee, :shipment_region, :shipment_schedule, :price)
  end

end
