require 'rails_helper'

RSpec.describe SearchedBookService do
   it 'retrieves book data for keyword', :vcr do
    parsed_json = SearchedBookService.get_all_keyword_matching_books("lord")
     expect(parsed_json).to be_a Hash
     expect(parsed_json[:data]).to be_a Array
     first_book = parsed_json[:data][0][:attributes]
     expect(first_book).to include(:title, :author)
     expect(first_book[:title]).to be_a String
     expect(first_book[:author]).to be_a String
   end
end
