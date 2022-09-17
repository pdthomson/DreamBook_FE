require 'rails_helper'

RSpec.describe Blogs do 

  it 'exists and has attributes' do 
    data = {
        data:
        {
            id: 1,
            type: "blog",
            attributes: {
              title: Faker::Book.title,
              body: Faker::Fantasy::Tolkien.poem,
              status: 0,
              user_id: 123
              }
          }
      }

      blog = Blog.new(data)

      expect(blog).to be_a Blog
      expect(blog.title).to eq(data[:data][:attributes][:title])
      expect(blog.body).to eq(data[:data][:attributes][:body])
      expect(blog.status).to eq(data[:data][:attributes][:status])
      expect(blog.user_id).to eq(data[:data][:attributes][:user_id])
  end
end