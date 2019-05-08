class User < ApplicationRecord
	has_many :likings
	has_many :comments
	has_many :posts, through: :likings
	has_many :posts, through: :comments
	validates_presence_of :username
  	validates_uniqueness_of :username

  	has_secure_password
end
