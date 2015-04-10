class UsersController < Devise::RegistrationsController

  def new
    super
  end

  def create
  	super
    # add custom create logic here
  end

  def show
  end

  def update
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password, :avatar)
  end

end 