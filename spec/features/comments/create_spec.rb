require 'rails_helper'

RSpec.describe "Comments Create Page" do
  before(:each) do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] =
    OmniAuth::AuthHash.new({:provider => 'google',
                            :uid => '123545',
                            :info => {
                              :email => 'email@gmail.com',
                              :first_name => 'Smudger'
                            },
                            :credentials => {
                              :token => '222'
                            }
                          })
  end

  it 'creates a comment in the back end', :vcr do
    # allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
    visit root_path
    click_on 'Log in/Register'
    click_on 'Dreams'
    blog_params= ({
                title: 'Purple Lizards',
                body: 'Had a dream where there was purple lizards everywhere',
                status: 'shared',
                user_id: 1
                })
    # blog = BlogService.send_blog(blog_params)
    blog = BlogFacade.user_blog(blog_params[:user_id])
    first(:button, 'Comment').click
    expect(current_path).to eq("/blogs/#{blog.id}/comments/new")
    comment = Faker::Book.title
    fill_in :comment_text, with: comment
    click_on 'Save'
    # blog_comments = CommentService.get_all_comments(blog.id)
    expect(current_path).to eq(blog_path(blog.id))
    expect(page).to have_content(comment)
  end
end
