require 'rails_helper'

RSpec.describe CommentFacade do
  it 'returns an array of blog objects', :vcr do
    blog_id = 1
    comment_objects = CommentFacade.all_comments(blog_id)

    expect(comment_objects).to be_an Array
    expect(comment_objects).to be_all Comment
  end
end
