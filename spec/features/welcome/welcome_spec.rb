require 'rails_helper'

RSpec.describe 'Welcome page' do
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
    expect(current_path).to eq(new_session_path)
  end
end
