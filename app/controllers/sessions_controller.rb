class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def new; end

  def create
    registered_user = User.find_by(user_name: params[:user_name])
    if registered_user && registered_user.authenticate(params[:password])
      session[:user_id] = registered_user.id
      redirect_to dashboard_index_path
    else
      flash[:error] = 'Your email or password are incorrect'
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to root_path
  end
end
