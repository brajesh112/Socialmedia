class User < ApplicationRecord
	has_one :account, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :posts, dependent: :destroy
	has_many :tags, dependent: :destroy
	has_many :comments ,->{includes :comments},dependent: :destroy
	has_secure_password
	has_one_attached :avatar, dependent: :destroy
	has_many :saved_posts, dependent: :destroy
	has_many :active_relationships, class_name: "Relationship",foreign_key: "follower_id", dependent: :destroy
	has_many :passive_relationships, class_name: "Relationship",foreign_key: "followed_id", dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed, dependent: :destroy
	has_many :followers, through: :passive_relationships, source: :follower,dependent: :destroy
	validates :user_name, :email, :password, :avatar, presence: true
end