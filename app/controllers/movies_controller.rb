class MoviesController < ApplicationController
  before_action :authenticate_user

  def index
    conn = Faraday.new(
      url: 'https://api.themoviedb.org',
      params: { api_key: ENV['movie_db_api'] }
    )
    response = conn.get("/3/search/movie?&query=#{params[:search]}")
    movies = JSON.parse(response.body, symbolize_name: true)
  end

  def show; end
end
