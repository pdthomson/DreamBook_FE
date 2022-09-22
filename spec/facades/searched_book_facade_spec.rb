require 'rails_helper'

RSpec.describe SearchedBookFacade do
  it 'returns a book containing the searched keyword', :vcr do

    result = SearchedBookFacade.one_book_matching_searched_keyword('lord')

    expect(result).to be_a SearchedBook
  end

  it 'sad path: if keyword does not exist in book api, send user 1947 book recommendation', :vcr do

    result = SearchedBookFacade.one_book_matching_searched_keyword('asjczsds')

    expect(result.title).to eq("1947")
  end
end
