class User < ApplicationRecord
  validates_presence_of :email, :username, :uid 
  validates_uniqueness_of :email, :username, :uid
end