require 'rails_helper'

RSpec.describe 'MovieFacade' do
  it 'returns an array of top rated movies'do
    VCR.use_cassette('returns top rated movie data correctly') do
      facade = MoviesFacade.top_rated_movies

      expect(facade).to be_an(Array)
      expect(facade[0]).to be_a(Movie)
    end
  end

  it 'returns an array of searched movies' do
    VCR.use_cassette('returns movie searched') do
    facade = MoviesFacade.search_result_movies('Dark')

    expect(facade).to be_an(Array)
    expect(facade[0]).to be_a(Movie)
    end
  end

  it 'returns movie with details' do
    VCR.use_cassette('returns movie data correctly') do
      facade = MoviesFacade.get_movie_details(278)

      expect(facade).to be_a(Movie)
      expect(facade.title).to eq('The Shawshank Redemption')
    end
  end

  it 'returns movie with reviews' do
    VCR.use_cassette('returns movie cast data correctly') do
      facade = MoviesFacade.get_movie_credits(278)

      expect(facade).to be_a(Movie)
      expect(facade.title).to eq('The Shawshank Redemption')
    end
  end

  it 'gets the movie review information' do
    VCR.use_cassette('returns movie reviews data correctly') do
      facade = MoviesFacade.get_movie_reviews(278)

      expect(facade).to be_a(Movie)
      expect(facade.title).to eq('The Shawshank Redemption')
    end
  end
end
