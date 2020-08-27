class Users::RegistrationsController < Devise::RegistrationsController
  def create
    @user=User.new(sign_up_params)
    if @user.save
      resource.remember_me = true
      sign_in :user, resource
      redirect_to root_path
    else
      render "new"
    end
  end
end
