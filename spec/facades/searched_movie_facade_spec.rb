require 'rails_helper'

RSpec.describe SearchedMovieFacade do
  it 'returns a movie containing the searched keyword', :vcr do

    result = SearchedMovieFacade.one_movie_matching_searched_keyword('Lizards')

    expect(result).to be_a SearchedMovie
  end

  it 'sad path: if keyword does not exist in movie api, send user Clash of the Empires movie recommendation', :vcr do

    result = SearchedMovieFacade.one_movie_matching_searched_keyword('dsfgsdhreujdtryjetsryujwartyhaeqrtyg')

    expect(result.title).to eq("Clash of the Empires")
  end
end
