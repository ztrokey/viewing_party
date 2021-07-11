class MoviesFacade
  class << self
    def top_rated_movies
      movies = MoviesService.get_top_rated_movies
      movies.map do |movie|
        Movie.new(movie)
      end
    end
  end
end
