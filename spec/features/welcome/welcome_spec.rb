require 'rails_helper'

RSpec.describe 'Welcome page' do
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

  it 'has a home link that redirects to welcome page' do
    visit root_path
    expect(page).to have_link('Home')
    click_on 'Home'
    expect(current_path).to eq(root_path)
  end

  it 'has a link to log in or register', :vcr do
    visit root_path
    expect(page).to have_link('Log in/Register')
    click_on 'Log in/Register'
    expect(current_path).to eq(dashboard_path)
  end

  it 'if logged in, no link to log in or create an account do', :vcr do
    visit root_path
    expect(page).to have_link('Log in/Register')
    click_link 'Log in/Register'
    expect(current_path).to eq(dashboard_path)
    visit root_path
    expect(page).to_not have_link('Log in/Register')
    expect(page).to have_link('Log out')
    click_link 'Log out'
    expect(current_path).to eq(root_path)
    expect(page).to have_link('Log in/Register')
  end

  it 'has a link to the user dashboard', :vcr do
    visit root_path
    expect(page).to have_link('Log in/Register')
    click_link 'Log in/Register'
    click_link 'Home'
    expect(page).to have_link('Dashboard')
    click_on 'Dashboard'
    expect(current_path).to eq(dashboard_path)
  end
end
