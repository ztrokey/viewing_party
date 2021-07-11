require 'rails_helper'

RSpec.describe MoviesService do
  it 'returns top rated movie data correctly', :vcr do
    data = MoviesService.get_top_rated_movies

    expect(data).to be_an(Array)
    expect(data[1]).to be_a(Hash)
    expect(data[1]).to have_key(:title)
    expect(data[1][:title]).to be_a(String)
    expect(data.count).to eq(40)
  end

  it 'returns movie searched', :vcr do
    data = MoviesService.get_search_results('Dark')

    expect(data).to be_an(Array)
    expect(data[0]).to be_a(Hash)
    expect(data[0]).to have_key(:title)
    expect(data[0][:title]).to be_a(String)
    expect(data.count).to eq(40)
  end

  it 'returns movie data correctly', :vcr do
    data = MoviesService.get_movie_details(278)

    expect(data).to be_a(Hash)
    expect(data).to have_key(:runtime)
    expect(data[:runtime]).to be_an(Integer)
    expect(data).to have_key(:genres)
    expect(data[:genres]).to be_an(Array)
    expect(data[:genres].count).to eq(2)
    expect(data[:genres][0]).to be_a(Hash)
    expect(data[:genres][0][:name]).to be_a(String)
    expect(data[:genres][1][:name]).to be_a(String)
  end

  it 'returns movie cast data correctly', :vcr do
    data = MoviesService.get_movie_cast(278)

    expect(data).to be_a(Hash)
    expect(data).to have_key(:cast)
    expect(data[:cast]).to be_an(Array)
    expect(data[:cast].count).to eq(61)
  end

  it 'returns movie reviews data correctly', :vcr do
    data = MoviesService.get_movie_reviews(278)

    expect(data).to be_a(Hash)
    expect(data).to have_key(:results)
    expect(data[:results]).to be_an(Array)
    expect(data[:results].count).to eq(6)
    expect(data[:results][0]).to have_key(:author)
    expect(data[:results][0][:author]).to be_a(String)
    expect(data[:results][0]).to have_key(:content)
    expect(data[:results][0][:content]).to be_a(String)
  end
end
