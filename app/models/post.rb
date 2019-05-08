class Post < ApplicationRecord
	has_many :likings
	has_many :comments, dependent: :destroy
	has_many :users, through: :comments
	has_many :users, through: :likings

	# belongs_to :user
end
