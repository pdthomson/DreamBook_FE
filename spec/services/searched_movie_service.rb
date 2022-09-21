require 'rails_helper'

RSpec.describe SearchedMovieService do
   it 'retrieves movie data for keyword', :vcr do
    parsed_json = SearchedMovieService.get_all_keyword_matching_movies("Lizards")
     expect(parsed_json).to be_a Hash
     expect(parsed_json[:data]).to be_a Array
     first_movie = parsed_json[:data][0][:attributes]
     expect(first_movie).to include(:title, :description)
     expect(first_movie[:title]).to be_a String
     expect(first_movie[:description]).to be_a String
   end
end
