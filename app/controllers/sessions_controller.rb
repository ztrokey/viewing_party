class SessionsController < ApplicationController
  def index; end

  def create
    registered_user = User.find_by(user_name: params[:user_name])
    if registered_user && registered_user.authenticate(params[:password])
      session[:user_id] = registered_user.id
      flash[:success] = "Welcome, #{registered_user.user_name}!"
      redirect_to dashboard_index_path
    else
      flash[:success] = 'Your email or password are incorrect'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to root_path
  end
end
