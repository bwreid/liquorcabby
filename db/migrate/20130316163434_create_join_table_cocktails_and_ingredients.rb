class CreateJoinTableCocktailsAndIngredients < ActiveRecord::Migration
  def change
    create_table :cocktails_ingredients do |j|
      j.integer :cocktail_id
      j.integer :ingredient_id
    end
  end
end
