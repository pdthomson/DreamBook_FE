require 'rails_helper'

RSpec.describe SearchedMovieFacade do
  it 'returns a movie containing the searched keyword', :vcr do

    result = SearchedMovieFacade.two_movies_matching_searched_keyword('Lizards')

    expect(result).to be_a SearchedMovie
  end
end
