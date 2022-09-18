require 'rails_helper'

RSpec.describe 'User Show Page' do
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

  it 'If user is logged in page has a link to log out and home page', :vcr do
    visit root_path
    click_on 'Log in/Register'
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_link('Home')
    expect(page).to have_link('Log out')
  end

  it 'can delete the user', :vcr do
    visit root_path
    click_on 'Log in/Register'
    expect(current_path).to eq(dashboard_path)
    expect(User.count).to eq(1)
    expect(page).to have_link('Delete Account')
    click_on 'Delete Account'
    expect(User.count).to eq(0)
    expect(current_path).to eq(root_path)
  end

  it 'can update a username', :vcr do
    visit root_path
    click_on 'Log in/Register'
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_link('Change Username')
    click_link 'Change Username'
    expect(current_path).to eq('/dashboard/update')
    fill_in :username, with: 'Tee'
    click_on 'Update'
    expect(current_path).to eq('/dashboard')
  end

  it 'can create a public blog', :vcr do
    visit root_path
    click_on 'Log in/Register'
    expect(page).to have_button('Record a Dream')
    click_on 'Record a Dream'
    expect(current_path).to eq(new_blog_path)
    fill_in :title, with: 'Test'
    fill_in :body, with: 'This is a test'
    select 'shared', :from => 'status'
    click_on 'Submit'
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_link('Test')
  end
end
