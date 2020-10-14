class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    @parents = Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @images = @item.images.build
    @parent_category = Category.where(ancestry: nil)

    # @items = Item.all
    # @items = Item.includes(:images).order('created_at DESC')
    # respond_to do |format|
    # format.html
    #   format.json
    # end
  end

  # def new
  #   @item = Item.new
  #   @images = @item.images.build
  # end

  def create
    @item = Item.new(item_params)
    if @item.valid? && @item.save!
      redirect_to root_path controller: :items, action: :index
    else
      @parent_category = Category.where(ancestry: nil)
      @item.images.new
      render "new"
    end
  end

  def show
    @parents = Category.where(ancestry: nil)
  end

  def edit
  end


  def get_children
    @categories = Category.where(ancestry: params[:category_id])
    respond_to do |format|
      format.json
    end
  end

  def get_grand_children
    @children_categories = Category.where(ancestry: params[:category_id])
    respond_to do |format|
      format.json
    end
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



  private

  def item_params
    params.require(:item).permit(:images, :name, :description, :category, :condition, :shipment_fee_id, :shipment_region_id, :shipment_schedule_id, :price, :category_id,[images_attributes: [:src]]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end

