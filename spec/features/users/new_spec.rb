require 'rails_helper' 

RSpec.describe 'Create New User' do 

# As a User
# When I visit '/' (this should be on the home page)

# I see a link to Create A Dreamer,
# When I click Create A Dreamer,
# I am redirected to '/user/new'
# And see a form to enter information
# (A dreamer will need username, email--authentication will be through OAuth)

  xit 'has a form to create a new user' do
    visit root_path

    expect(page).to have_link('Create a Dreamer')
    click_on ('Create a Dreamer')

    expect(current_path).to eq(new_user_path)

    username = "Smudger"
    
    fill_in :user_name, with: username
    click_on 'Register'
  end
end