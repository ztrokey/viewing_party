require 'rails_helper'

RSpec.describe 'MovieFacade' do
  it 'returns an array of top rated movies', :vcr  do
    facade = MoviesFacade.top_rated_movies

    expect(facade).to be_an(Array)
    expect(facade[0]).to be_a(Movie)
  end

  it 'returns an array of searched movies', :vcr  do
    facade = MoviesFacade.search_result_movies('Dark')

    expect(facade).to be_an(Array)
    expect(facade[0]).to be_a(Movie)
  end

  it 'returns movie with details', :vcr  do
    facade = MoviesFacade.get_movie_details(278)

    expect(facade).to be_a(Movie)
    expect(facade.title).to eq('The Shawshank Redemption')
  end

  it 'returns movie with credit information', :vcr  do
    facade = MoviesFacade.get_movie_credits(278)

    expect(facade).to be_a(Movie)
    expect(facade.title).to eq('The Shawshank Redemption')
  end

  it 'returns movie with review information', :vcr  do
    facade = MoviesFacade.get_movie_reviews(278)

    expect(facade).to be_a(Movie)
    expect(facade.title).to eq('The Shawshank Redemption')
  end
end
