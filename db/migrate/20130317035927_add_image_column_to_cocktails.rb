class AddImageColumnToCocktails < ActiveRecord::Migration
  def change
    add_column :cocktails, :image, :string, :default => '/assets/default.jpg'
  end
end
