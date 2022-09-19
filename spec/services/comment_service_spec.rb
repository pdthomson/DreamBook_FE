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
end
