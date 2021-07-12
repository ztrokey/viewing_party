class MoviesFacade
  class << self
    def top_rated_movies
      movies = MoviesService.get_top_rated_movies
      movies.map do |movie|
        movie = MoviesService.get_movie_details(movie[:id])
        cast = MoviesService.get_movie_cast(movie[:id])
        reviews = MoviesService.get_movie_reviews(movie[:id])
        Movie.new(movie, cast, reviews)
      end
    end

    def search_result_movies(search_params)
      movies = MoviesService.get_search_results(search_params)
      movies.map do |movie|
        movie = MoviesService.get_movie_details(movie[:id])
        cast = MoviesService.get_movie_cast(movie[:id])
        reviews = MoviesService.get_movie_reviews(movie[:id])
        Movie.new(movie, cast, reviews)
      end
    end

    def get_movie_details(movie_id)
      movie = MoviesService.get_movie_details(movie_id)
      cast = MoviesService.get_movie_cast(movie_id)
      reviews = MoviesService.get_movie_reviews(movie_id)
      Movie.new(movie, cast, reviews)
    end

    def get_movie_credits(movie_id)
      movie = MoviesService.get_movie_details(movie_id)
      cast = MoviesService.get_movie_cast(movie_id)
      reviews = MoviesService.get_movie_reviews(movie_id)
      Movie.new(movie, cast, reviews)
    end

    def get_movie_reviews(movie_id)
      movie = MoviesService.get_movie_details(movie_id)
      cast = MoviesService.get_movie_cast(movie_id)
      reviews = MoviesService.get_movie_reviews(movie_id)
      Movie.new(movie, cast, reviews)
    end
  end
end


# need to add cast and reviews either to Movies PORO or create new PORO's
