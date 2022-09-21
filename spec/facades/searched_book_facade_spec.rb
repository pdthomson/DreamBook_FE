require 'rails_helper'

RSpec.describe SearchedBookFacade do
  it 'returns a book containing the searched keyword', :vcr do

    result = SearchedBookFacade.one_book_matching_searched_keyword('lord')

    expect(result).to be_a SearchedBook
  end

  xit 'sad path: if keyword does not exist in book api, send user Lord of the Rings book recommendation', :vcr do

    result = SearchedBookFacade.one_book_matching_searched_keyword('dsfgsdhreujdtryjetsryujwartyhaeqrtyg')

    expect(result.title).to eq("Lord of the Rings")
  end
end
