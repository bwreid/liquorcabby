class AddUserIdColumnToCocktails < ActiveRecord::Migration
  def change
    create_table :cocktails_users do |t|
      t.integer :cocktail_id
      t.integer :user_id
    end
  end
end
