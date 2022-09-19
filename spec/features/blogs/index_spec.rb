require 'rails_helper'

RSpec.describe 'Blogs page' do
  it 'it can redirect you to home' do
    visit blogs_path
    expect(page).to have_link('Home')
    click_on 'Home'
    expect(current_path).to eq(root_path)
  end

  it 'has a link to log out' do
    visit blogs_path
    expect(page).to have_link('Logout')
    click_on 'Logout'
    # expect(current_path).to eq('Home')
  end

  xit 'has a link to the dashboard', :vcr do
    #how do we use syntax to have a user logged in without having to say visit X log in and do blah blah blah..
    visit blogs_path
    expect(page).to have_link('Dashboard')
    click_on 'Dashboard'
    expect(current_path).to eq(dashboard_path)
  end

  # it 'can list the top 10 blogs', :vcr do 
  #   visit blogs_path
  #   expect(page).to 
  # end
  #need more seeds and info to complete test
end
