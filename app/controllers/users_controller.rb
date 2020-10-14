class UsersController < ApplicationController
  before_action :authenticate_user!,except: [:out]
  def show
    @parents = Category.where(ancestry: nil)
  end

  def out
    @parents = Category.where(ancestry: nil)
  end

end