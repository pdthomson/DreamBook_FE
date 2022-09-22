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

  it 'sends a blog', :vcr do
     blog_params = ({
                    title: 'Im watching you',
                    body: 'from the dream team',
                    user_id: 100000,
                    status: 'shared',
                    keyword: "dream"
                    })

     response = BlogService.send_blog(blog_params)
     new_blog = BlogService.get_all_blogs[:data].last
     expect(new_blog[:attributes][:title]).to eq('Im watching you')
     expect(new_blog[:attributes][:body]).to eq('from the dream team')
     expect(new_blog[:attributes][:user_id]).to eq(100000)
     expect(new_blog[:attributes][:keyword]).to eq('dream')
     expect(new_blog[:attributes][:status]).to eq('shared')
   end
end
