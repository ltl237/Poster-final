class User < ApplicationRecord
	has_many :likings, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :posts, through: :likings, dependent: :destroy
	has_many :posts, through: :comments, dependent: :destroy
	validates_presence_of :username
  	validates_uniqueness_of :username

  	has_secure_password
end
