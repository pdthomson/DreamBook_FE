require "rails_helper"

RSpec.describe "Blog Create Page" do
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

  it 'creates a blog in the back end', :vcr do
    visit root_path
    click_on 'Log in/Register'
    visit '/blogs/new'
    title = Faker::Book.title
    fill_in :title, with: title
    fill_in :body, with: Faker::Fantasy::Tolkien.poem
    fill_in :keyword, with:'toad'
    select "shared", :from => "status"
    click_on 'Submit'
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_link(title)
  end

  it 'sad path keyword search with more than one word', :vcr do
      visit root_path
      click_on 'Log in/Register'
      visit '/blogs/new'
      title = Faker::Book.title
      fill_in :title, with: title
      fill_in :body, with: Faker::Fantasy::Tolkien.poem
      fill_in :keyword, with:'fail me'
      select "shared", :from => "status"
      click_on 'Submit'
      expect(current_path).to eq(new_blog_path)
      expect(page).to have_content('Keyword must be one word!')
  end
end
