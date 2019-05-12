class Post < ApplicationRecord
	has_many :likings, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :users, through: :comments, dependent: :destroy
	has_many :users, through: :likings, dependent: :destroy
	belongs_to :user

	# belongs_to :user
end
