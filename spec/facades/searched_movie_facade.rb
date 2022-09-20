require 'rails_helper'

RSpec.describe SearchedMovieFacade do
  it 'returns an array of 2 movies containing the searched keyword', :vcr do
    array_of_2_movies_matching_searched_keyword = SearchedMovieFacade.two_movies_matching_searched_keyword

    expect(array_of_2_movies_matching_searched_keyword).to be_a Array
    expect(array_of_2_movies_matching_searched_keyword).to be_all SearchedMovie
  end
end
