class MoviesFacade
  class << self
    def top_rated_movies
      movies = MoviesService.get_top_rated_movies
      movies.map do |movie|
        Movie.new(movie)
      end
    end

    def search_result_movies(search_params)
      movies = MoviesService.get_search_results(search_params)
      movies.map do |movie|
        Movie.new(movie)
      end
    end

    def get_movie_details(movie_id)
      movie = MoviesService.get_movie_details(movie_id)
      Movie.new(movie)
    end
  end
end

# need to add cast and reviews either to Movies PORO or create new PORO's
