require 'rails_helper'

RSpec.describe 'User Show Page' do
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

  it 'If user is logged in page has a link to log out and home page', :vcr do
    visit root_path
    click_on 'Log in/Register'
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_link('Home')
    expect(page).to have_link('Log out')
  end

  it 'can delete the user', :vcr do
    visit root_path
    click_on 'Log in/Register'
    expect(current_path).to eq(dashboard_path)
    expect(User.count).to eq(1)
    expect(page).to have_link('Delete Account')
    click_on 'Delete Account'
    expect(User.count).to eq(0)
    expect(current_path).to eq(root_path)
  end

  it 'can update a username', :vcr do
    visit root_path
    click_on 'Log in/Register'
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_link('Change Username')
    click_link 'Change Username'
    expect(current_path).to eq('/dashboard/update')
    fill_in :username, with: 'Tee'
    click_on 'Update'
    expect(current_path).to eq('/dashboard')
  end

  it 'can create a public blog', :vcr do
    visit root_path
    click_on 'Log in/Register'
    expect(page).to have_link('Record a Dream')
    click_on 'Record a Dream'
    expect(current_path).to eq(new_blog_path)
    fill_in :title, with: 'Test'
    fill_in :body, with: 'This is a test'
    select 'shared', :from => 'status'
    click_on 'Submit'
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_link('Test')
  end

  xit 'can create a private blog', :vcr do
    visit root_path
    click_on 'Log in/Register'
    expect(page).to have_button('Record a Dream')
    click_on 'Record a Dream'
    expect(current_path).to eq(new_blog_path)
    fill_in :title, with: 'private'
    fill_in :body, with: 'you cant see'
    select 'hidden', :from => 'status'
    click_on 'Submit'
    click_link 'Home'
    click_link 'Blogs'
    expect(current_path).to eq(blogs_path)
    expect(page).to_not have_link('private')
  end

  it 'has 2 movie references for a blog', :vcr do 
    visit root_path
    click_on 'Log in/Register'
    visit '/blogs/new'
    title = Faker::Book.title
    fill_in :title, with: title
    fill_in :body, with: Faker::Fantasy::Tolkien.poem
    fill_in :keyword, with:'shawshank'
    select "shared", :from => "status"
    click_on 'Submit'
    data = [{
      "adult": false,
      "backdrop_path": "/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg",
      "genre_ids": [
          18,
          80
      ],
      "id": 278,
      "original_language": "en",
      "original_title": "The Shawshank Redemption",
      "overview": "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
      "popularity": 77.948,
      "poster_path": "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
      "release_date": "1994-09-23",
      "title": "The Shawshank Redemption",
      "video": false,
      "vote_average": 8.7,
      "vote_count": 22302
  },
  {
      "adult": false,
      "backdrop_path": "/u6hgtSIzW8nDKKWmun9JDhZz2fp.jpg",
      "genre_ids": [
          99
      ],
      "id": 546312,
      "original_language": "en",
      "original_title": "Shawshank: The Redeeming Feature",
      "overview": "Film critic and presenter Mark Kermode explores the fascination and praise audiences, fans and critics have behind the classic The Shawshank Redemption (1994) and how its importance grew higher over the years despite being an overlooked film when it was released and not getting any Oscars victories when it was nominated as one of the Best Pictures of the Year.",
      "popularity": 0.6,
      "poster_path": "/b7DGM74MRfiLqEveVKwh0jnQ8zX.jpg",
      "release_date": "2001-09-08",
      "title": "Shawshank: The Redeeming Feature",
      "video": false,
      "vote_average": 8.7,
      "vote_count": 14
  }]
    expect(page).to have_content(data[0][:title])
    expect(page).to have_content(data[1][:title])
  end
end
