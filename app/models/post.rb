class Post < ApplicationRecord
	has_many :comments, ->{where comment_id:nil}, dependent: :destroy
	belongs_to :user
	has_many :likes ,as: :likeable, dependent: :destroy
	has_many :saved_posts, dependent: :destroy
	has_one_attached :image, dependent: :destroy
	validates :image,:description, presence: true
end
