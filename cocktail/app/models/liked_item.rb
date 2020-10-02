class LikedItem < ApplicationRecord
    belongs_to :user
    belongs_to :drink

    def self.like(user_id, drink_id)
        byebug
        #@like = LikedItem.create(user_id, drink_id)
        puts @like
    end 
end
