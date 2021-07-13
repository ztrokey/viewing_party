class DashboardController < ApplicationController
  before_action :authenticate_user
  def index; end

  def create
    friend = User.find_by(email: params[:friends])
    if friend
      current_user.friends << friend
    else
      flash[:alert] = 'Please enter a vaild email address'
    end
    redirect_to dashboard_index_path
  end
end
