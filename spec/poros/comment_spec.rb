require 'rails_helper'

RSpec.describe Comment do
  it 'exists and has attributes' do
    data =  {
              "id": "1",
              "type": "comment",
              "attributes": {
                  "user_id": 2,
                  "blog_id": 1,
                  "comment_text": "sounds like a nighmare!"
              }
            }

    comment = Comment.new(data)
    expect(comment).to be_a Comment
    expect(comment.user_id).to eq(data[:attributes][:user_id])
    expect(comment.blog_id).to eq(data[:attributes][:blog_id])
    expect(comment.comment_text).to eq(data[:attributes][:comment_text])
  end
end
