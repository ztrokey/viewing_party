require 'rails_helper'

RSpec.describe 'Movies Show Page' do
  before :each do
    @current_user = User.create(user_name: "Vicki Vallencourt", email: 'highqualityh2o@ex.com', password: 'pickles')
    @movie = Movie.new(movie_data, cast_data, reviews_data)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)

    visit movie_path(@movie.id)
  end

  it 'shows a button to create a viewing party' do
    expect(page).to have_button('Create a viewing party')
  end

  it "should display the movie title, Vote Average, Genere(s), Summary description" do
    expect(page).to have_content(@movie.title)
    expect(page).to have_content(@movie.vote_average)
    expect(page).to have_content(@movie.genres)
    expect(page).to have_content(@movie.summary)
  end

  it "should display Runtime in hours & minutes, list the first 10 cast members, count of total reviews, and each review's author and information" do
    last_review_author = @movie.reviews.last[:author]
    last_review = @movie.reviews.last[:content]

    last_cast_member_name = @movie.cast.last[:name]
    last_cast_member_character = @movie.cast.last[:character]

    expect(page).to have_content(last_review_author)
    expect(page).to have_content(last_review)
    expect(page).to have_content(last_cast_member_name)
    expect(page).to have_content(last_cast_member_character)
    expect(page).to have_content(@movie.reviews.count)
    expect(page).to have_content("2hours and 22minutes")

    within('.movie-cast') do
      expect(page.all('ul', count: 10))
    end
    
    within('.movie-reviews') do
      expect(page.all('ul', count: 6))
    end
  end
end
