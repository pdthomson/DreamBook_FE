require 'rails_helper'

RSpec.describe 'update blog' do
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

  xit 'it can update a blog', :vcr do
    visit '/blogs/1'
    expect(page).to have_link('Update')
    click_on 'Update'
    expect(current_path).to eq(blog_path)
  end

end