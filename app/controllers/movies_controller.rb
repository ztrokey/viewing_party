class MoviesController < ApplicationController
    def index
      if params[:search]

        conn = Faraday.new(
        url: "https://api.themoviedb.org",
        params: { api_key: ENV['movie_db_api'] })
        response_searched1 = conn.get("/3/search/movie?&query=#{params[:search]}&page=1")
        response_searched2 = conn.get("/3/search/movie?&query=#{params[:search]}&page=2")
        parsed_searched1 = JSON.parse(response_searched1.body, symbolize_names: true)
        parsed_searched2 = JSON.parse(response_searched2.body, symbolize_names: true)
        # require 'pry'; binding.pry
        @results = parsed_searched1[:results] + parsed_searched2[:results]

        movie = @results.find { |r|  }
      end
    end

    def show; end
end
