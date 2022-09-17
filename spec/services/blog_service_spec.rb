require 'rails_helper'

RSpec.describe BlogService do
   it 'retrieves blog data', :vcr do
    parsed_json = BlogService.get_all_blogs
     expect(parsed_json).to be_a Hash
     expect(parsed_json[:data]).to be_a Array
     first_blog = parsed_json[:data][0][:attributes]
     expect(first_blog).to include(:title, :body, :status, :user_id)
     expect(first_blog[:title]).to be_a String
     expect(first_blog[:body]).to be_a String
     expect(first_blog[:status]).to be_a String
     expect(first_blog[:user_id]).to be_a Integer
   end
end
