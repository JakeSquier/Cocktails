class User < ApplicationRecord
    has_many :liked_items
    has_many :drinks, through: :liked_items
    has_many :disliked_items
    has_many :drinks, through: :disliked_items
    has_secure_password
end