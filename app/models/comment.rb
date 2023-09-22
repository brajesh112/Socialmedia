class Comment < ApplicationRecord
	belongs_to :comment, class_name: "Comment", optional: true, dependent: :destroy
	has_many :replies,class_name: "Comment", foreign_key: "comment_id", dependent: :destroy
	has_many :likes, as: :likeable, dependent: :destroy
	belongs_to :post 
	belongs_to :user
end
