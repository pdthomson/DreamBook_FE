require 'rails_helper'

RSpec.describe 'OAuth Login with Google' do
  context 'happy path' do
    before(:each) do
      OmniAuth.config.test_mode = true
    end
    it 'redirects and creates a new user' do
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
        
      visit '/auth/google_oauth2/'

      expect(current_path).to eq('/dashboard')
      expect(User.last.email).to eq('email@gmail.com')
      expect(User.last.username).to eq('Smudger')
    end
  end
end