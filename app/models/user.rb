class User < ApplicationRecord
  validates_presence_of :email, :username, :uid 
  validates_uniqueness_of :email, :username, :uid
  
  def self.most_recent_blog
    blogs = BlogFacade.all_blogs
    shared_blogs = []
    blogs.map do |blog|
      if blog.status == 'shared'
        shared_blogs << blog
      end
    end
    shared_blogs.last
  end 
end