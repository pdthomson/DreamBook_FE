require 'rails_helper'

RSpec.describe 'Welcome page' do
  it 'has a home link that redirects to welcome page' do
    visit root_path

    expect(page).to have_link('Home')
    click_on 'Home'
    expect(current_path).to eq(root_path)
  end
end
