class MoviesController < ApplicationController
  before_action :authenticate_user

  def index
    conn = Faraday.new(
      url: 'https://api.themoviedb.org',
      params: { api_key: ENV['movie_db_api'] }
    )
    response1 = conn.get("/3/search/movie?&query=#{params[:search]}&page=1")
    response2 = conn.get("/3/search/movie?&query=#{params[:search]}&page=2")
    parsed1 = JSON.parse(response1.body, symbolize_names: true)
    parsed2 = JSON.parse(response2.body, symbolize_names: true)
    @results = parsed1[:results] + parsed2[:results]
  end

  def show; end
end
