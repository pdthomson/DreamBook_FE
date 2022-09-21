require 'rails_helper'

RSpec.describe User, type: :model do 
  describe 'validations' do 
      it { should validate_presence_of :email }
      it { should validate_uniqueness_of :email }
      it { should validate_presence_of :username }
      it { should validate_uniqueness_of :username }
      it { should validate_uniqueness_of :uid }
  end
  describe 'methods' do
    it 'most_recent_blog', :vcr do
      blog = User.most_recent_blog
      expect(blog.title).to be_a String
      expect(blog.status).to eq("shared")
      expect(blog).to be_a Blog
    end
  end
end