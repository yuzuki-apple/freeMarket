class UsersController < ApplicationController
  before_action :authenticate_user!,except: [:out]
  def show
  end

  def out
  end

end