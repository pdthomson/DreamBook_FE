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
    visit "/blogs/2"
    expect(page).to have_content('Flying')
    expect(page).to have_content("where cats were flying")
    expect(page).to have_content("Comments:")
    # within "#comments" do
    #   expect(page).to have_content("sounds so pretty!")
    # end
  end
end

 