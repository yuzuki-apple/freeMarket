class Users::RegistrationsController < Devise::RegistrationsController
  def create
    @user=User.new(sign_up_params)
    if @user.save
      redirect_to new_address_path
    else
      render "new"
    end
  end
end
