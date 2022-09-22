require 'rails_helper'

RSpec.describe 'Blogs Show' do
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
  it 'it can redirect you to home', :vcr do
    visit root_path
    click_on 'Log in'
    visit blogs_path
    expect(page).to have_link('Home')
    click_on 'Home'
    expect(current_path).to eq(root_path)
  end

  it 'has a link to the dashboard', :vcr do
    visit root_path
    click_on 'Log in'

    visit blogs_path
    expect(page).to have_link('Dashboard')
    click_on 'Dashboard'
    expect(current_path).to eq(dashboard_path)
  end
  it 'it has a title, body, and comments section', :vcr do
    visit root_path
    click_on 'Log in'
    click_on 'Record a Dream'
    fill_in :title, with: "Green Skies"
    fill_in :body, with: "The sky was a vibrant green"
    fill_in :keyword, with: 'sky'
    select "shared", :from => "status"
    click_on 'Submit'
    click_on 'Green Skies'

    expect(page).to have_content('Green Skies')
    expect(page).to have_content("The sky was a vibrant green")
    expect(page).to have_content("Comments:")
   
  end
   it 'creates a comment in the back end', :vcr do
    # allow_any_instance_of(ApplicationController).to receive(:session_auth).and_return(true)
    visit root_path
    click_on 'Log in/Register'
    click_on 'Record a Dream'
    fill_in :title, with: "Green Skies"
    fill_in :body, with: Faker::Fantasy::Tolkien.poem
    fill_in :keyword, with: 'sky'
    select "shared", :from => "status"
    click_on 'Submit'
    click_on 'Green Skies'

    comment = "THIS IS THE COMMENT"
    fill_in :comment_text, with: comment
    click_on 'Save'
    expect(page).to have_content(comment)
  end
end

 