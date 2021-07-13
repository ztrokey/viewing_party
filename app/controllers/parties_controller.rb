class PartiesController < ApplicationController
  before_action :find_movie
  def new
    @movie
  end

  def create

  end

  private
  def party_params

  end

  def find_movie
    @movie = MoviesFacade.get_movie_details(params[:movie_id])
  end
end
