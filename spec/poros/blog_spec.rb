require 'rails_helper'

RSpec.describe Blog do 

  it 'exists and has attributes' do 
    data = {
            id: 1,
            type: "blog",
            attributes: {
              title: Faker::Book.title,
              body: Faker::Fantasy::Tolkien.poem,
              status: 0,
              user_id: 123
            }
          }

      blog = Blog.new(data)

      expect(blog).to be_a Blog
      expect(blog.title).to eq(data[:attributes][:title])
      expect(blog.body).to eq(data[:attributes][:body])
      expect(blog.status).to eq(data[:attributes][:status])
      expect(blog.user_id).to eq(data[:attributes][:user_id])
  end
end