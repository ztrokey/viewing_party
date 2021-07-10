class MoviesController < ApplicationController
    def index
      if !params[:search]
        conn = Faraday.new(
        url: "https://api.themoviedb.org",
        params: { api_key: ENV['movie_db_api'] })
        page1 = conn.get('/3/movie/top_rated?&page=1')
        page2 = conn.get('/3/movie/top_rated?&page=2')

        parsed1 = JSON.parse(page1.body, symbolize_names: true)
        parsed2 = JSON.parse(page2.body, symbolize_names: true)

        @movies = parsed1[:results] + parsed2[:results]
      elsif params[:search] 
        conn = Faraday.new(
        url: "https://api.themoviedb.org",
        params: { api_key: ENV['movie_db_api'] })
        response_searched1 = conn.get("/3/search/movie?&query=#{params[:search]}&page=1")
        response_searched2 = conn.get("/3/search/movie?&query=#{params[:search]}&page=2")
        parsed_searched1 = JSON.parse(response_searched1.body, symbolize_names: true)
        parsed_searched2 = JSON.parse(response_searched2.body, symbolize_names: true)
        # require 'pry'; binding.pry
        @results = parsed_searched1[:results] + parsed_searched2[:results]
      end
    end

    def show; end
end
