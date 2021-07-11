class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :summary

  def initialize(movie_info)
    @id = movie_info[:id]
    @title = movie_info[:title]
    @vote_average = movie_info[:vote_average]
    @runtime = movie_info[:runtime]
    @genres = movie_info[:genres]
    @summary = movie_info[:overview]
  end

  def genres
    @genres.map { |genre| genre[:name] }
  end
end
