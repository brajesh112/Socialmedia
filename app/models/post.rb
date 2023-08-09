class Post < ApplicationRecord
	has_many :comments, ->{where comment_id:nil}
	belongs_to :user
	has_many :likes ,as: :likeable
end
