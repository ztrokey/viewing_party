class PartiesController < ApplicationController
  before_action :find_movie
  def new; end

  def create
    @party = current_user.parties.new(party_params)
    params[:friends].delete_at(0)
    @party.save
    params[:friends].each do |friend|
      Viewer.create!(party_id: @party.id, user: User.find(friend.to_i))
    end
    redirect_to dashboard_index_path
  end

  private

  def party_params
    params.permit(:host_id, :movie_id, :movie_title, :start_date, :start_time, :length)
  end

  def find_movie
    @movie = MoviesFacade.get_movie_details(params[:movie_id])
  end
end
