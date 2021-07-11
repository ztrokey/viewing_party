require 'rails_helper'

RSpec.describe 'MovieFacade' do
  it 'returns an array of top rated movies'do
    VCR.use_cassette('returns top rated movie data correctly') do
      facade = MoviesFacade.top_rated_movies

      expect(facade).to be_an(Array)
      expect(facade[0]).to be_a(Movie)
    end
  end

  # it 'returns an array of top rated movies', :vcr do
  #   facade = MoviesFacade.top_rated_movies
  #
  #   expect(facade).to be_an(Array)
  #   expect(facade[0]).to be_a(Movie)
  # end

  it 'returns' do
    VCR.use_cassette('returns movie data correctly') do
      facade = MoviesFacade.get_movie_details(278)

      expect(facade).to be_an()
      expect(facade[0]).to be_a()
    end
  end

  it 'returns' do
    VCR.use_cassette('returns movie cast data correctly') do
      facade = MoviesFacade.get_movie_cast(278)

      expect(facade).to be_an()
      expect(facade[0]).to be_a()
    end
  end

  it 'returns' do
    VCR.use_cassette('returns movie reviews data correctly') do
      facade = MoviesFacade.get_movie_reviews(movie_id)

      expect(facade).to be_an()
      expect(facade[0]).to be_a()
    end
  end
end
