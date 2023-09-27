class Post < ApplicationRecord
	has_many :comments, ->{where comment_id:nil}, dependent: :destroy
	belongs_to :user
	has_and_belongs_to_many :tags, dependent: :destroy
	has_many :likes ,as: :likeable, dependent: :destroy
	has_many :saved_posts, dependent: :destroy
	has_one_attached :image, dependent: :destroy
	validates :image,:description, presence: true
	validates :image, attached: true, content_type: ['image/png', 'image/jpeg','video/mp4']
	validates :image, attached: true, size: {less_than: 5.megabyte}
end
