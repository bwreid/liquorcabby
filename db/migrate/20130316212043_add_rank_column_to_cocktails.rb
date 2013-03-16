class AddRankColumnToCocktails < ActiveRecord::Migration
  def change
    add_column :cocktails, :rank, :integer, :default => 0
  end
end
