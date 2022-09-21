require 'rails_helper'

RSpec.describe 'Deletes blog' do
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

  it 'it can Delete a blog', :vcr do
    visit root_path
    click_on 'Log in/Register'
    click_on 'Record a Dream'
    fill_in :title, with: "Green Skies"
    fill_in :body, with: Faker::Fantasy::Tolkien.poem
    fill_in :keyword, with: 'sky'
    select "shared", :from => "status"
    click_on 'Submit'
    click_on 'Green Skies'
    click_on 'Delete Blog'

    expect(page).to_not have_content('Green Skies')
  end

end
