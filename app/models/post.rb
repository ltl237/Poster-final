class Post < ApplicationRecord
	has_many :likings
	has_many :taggings
	has_many :users, through: :taggings
	has_many :users, through: :likings
	# belongs_to :user
end
