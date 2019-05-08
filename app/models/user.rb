class User < ApplicationRecord
	has_many :likings
	has_many :taggings
	has_many :posts, through: :likings

	validates_presence_of :username
  	validates_uniqueness_of :username

  	has_secure_password
end
