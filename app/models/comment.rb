class Comment < ApplicationRecord
	belongs_to :comment, class_name: "Comment", optional: true
	has_many :replies,class_name: "Comment", foreign_key: "comment_id"
	has_many :likes, as: :likeable
	belongs_to :post 
end
