class MoviesController < ApplicationController
  before_action :authenticate_user

  def index
    if !params[:search]
      @top_rated_movies = MoviesFacade.top_rated_movies
    else
      @search_result_movies = MoviesFacade.search_result_movies(params[:search])
    end
  end

  def show
    @movie = MoviesFacade.get_movie_details(params[:id])
  end
end
