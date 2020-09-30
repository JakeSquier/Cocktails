class Drink < ApplicationRecord
    has_many :liked_items
    has_many :users, through: :liked_items
    has_many :disliked_items
    has_many :users, through: :disliked_items
    has_many :drink_ingredients
    has_many :ingredients, through: :drink_ingredients

    def self.fetch_id(name)
        Drink.all.find{ |drink| drink.name == name}.id
    end 

    def existing(name)
        Drink.all.each do |drink|
            if drink.name == name
                return true
            end
        end
        false
    end 
end
