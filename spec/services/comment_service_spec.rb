require 'rails_helper'

RSpec.describe CommentService do
  it 'retrieves comment data', :vcr do
    blog_id = 1

      parsed_json = CommentService.get_all_comments(blog_id)
      expect(parsed_json).to be_a Hash
      expect(parsed_json[:data]).to be_a Array
      first_comment = parsed_json[:data][0][:attributes]
      expect(first_comment).to include(:user_id, :blog_id, :comment_text)
      expect(first_comment[:user_id]).to be_a Integer
      expect(first_comment[:blog_id]).to be_a Integer
      expect(first_comment[:comment_text]).to be_a String
  end
  it 'sends a comment to backend', :vcr do
    user = User.create!(email: 'test@test.com', username: 'testname', uid: '12345')
    blog_params = ({
                   title: 'testing',
                   body: 'body test',
                   user_id: 1,
                   status: 'shared'
                   })

    response = BlogService.send_blog(blog_params)
    blog_id = BlogService.get_all_blogs[:data].last[:id].to_i
    comment_params = ({
                comment_text: 'bts butter',
                blog_id: blog_id,
                user_id: user.id
                })
    comment = CommentService.send_comment(comment_params)
    new_comment = CommentService.get_all_comments(blog_id)[:data].last
    expect(new_comment[:attributes][:comment_text]).to eq('bts butter')
    expect(new_comment[:attributes][:user_id]).to eq(user.id)
    expect(new_comment[:attributes][:blog_id]).to eq(blog_id)
  end
end
