class CreateDrinkIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :drink_ingredients do |t|
      t.integer :ingredient_id
      t.integer :drink_id
      t.timestamps
    end
  end
end
