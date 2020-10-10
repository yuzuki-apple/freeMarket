class ItemsController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def new
    @parent_category = Category.where(ancestry: nil)
  end

  def show
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
end
