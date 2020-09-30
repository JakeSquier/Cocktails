class Ingredient < ApplicationRecord
    has_many :drink_ingredients
    has_many :drinks, through: :drink_ingredients

    def self.existing(newIngredient)
        Ingredient.all.each do |ingredient| 
            if ingredient.name == newIngredient
                return true
            end 
        end 
        false
    end 

    def self.fetch_id(ingredient)
        Ingredient.all.find{ |i| i.name == ingredient}.id
    end 
end
