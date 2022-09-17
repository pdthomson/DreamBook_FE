require 'rails_helper'

RSpec.describe BlogFacade do 
  it 'returns an array of blog objects', :vcr do 
    blog_objects = BlogFacade.all_blogs

    expect(blog_objects).to be_an Array
    expect(blog_objects).to be_all Blog
  end
end