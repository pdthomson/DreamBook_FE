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

  it 'create a dreamer link' do
    visit root_path
    expect(page).to have_link('Create a Dreamer')
    click_on 'Create a Dreamer'
    expect(current_path).to eq(new_user_path)
  end

  it 'has a link to log in' do
    visit root_path
    expect(page).to have_link('Log in')
    click_on 'Log in'
    expect(current_path).to eq(dashboard_path)
  end

  it 'if logged in, no link to log in or create an account do' do
    visit root_path
    expect(page).to have_link('Log in')
    click_link 'Log in'
    expect(current_path).to eq(dashboard_path)
    visit root_path
    expect(page).to_not have_link('Log in')
    expect(page).to_not have_link('Create a Dreamer')
    expect(page).to have_link('Log out')
    click_link 'Log out'
    expect(current_path).to eq(root_path)
    expect(page).to have_link('Log in')
    expect(page).to have_link('Create a Dreamer')
  end
end
