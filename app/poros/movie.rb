class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :cast,
              :reviews

  def initialize(movie_info, cast_info, review_info)
    @id = movie_info[:id]
    @title = movie_info[:title]
    @vote_average = movie_info[:vote_average]
    @runtime = movie_info[:runtime]
    @genres = movie_info[:genres]
    @summary = movie_info[:overview]
    @cast  = cast_info[:cast][0..9]
    @reviews  = review_info[:results]
  end

  def genres
    @genres.map { |genre| genre[:name] }.join(', ')
  end
end
