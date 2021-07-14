class UsersController < ApplicationController
  skip_before_action :authenticate_user
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    return unless new_user.save

    session[:user_id] = new_user.id
    redirect_to dashboard_index_path, method: :post
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end
end
