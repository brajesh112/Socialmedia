class User < ApplicationRecord
has_one :account
has_many :posts
has_many :comments ,->{includes :comments} 
has_secure_password
end
