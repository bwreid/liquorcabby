# == Schema Information
#
# Table name: cocktails
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_by  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  rank        :integer          default(0)
#  image       :string(255)      default("/assets/default.jpg")
#

require 'spec_helper'

describe Cocktail do
  describe '.new' do
    it 'should create a new instance of Cocktail' do
      cocktail = Cocktail.new
      expect(cocktail).to be_an_instance_of(Cocktail)
    end
  end

  describe '.create' do
    it 'should save a new Cocktail to the database' do
      create_ingredients

      cocktail = Cocktail.create( name: 'Manhattan', description: 'ACCIO LIQUORUS!', created_by: 1, ingredients: Ingredient.all )
      expect(cocktail.id).to_not be nil
    end

    it 'SHOULD NOT save if the user does not provide all fields and at least two ingredients' do
      create_ingredients

      # NO NAME
      cocktail = Cocktail.create( description: 'ACCIO LIQUORUS!', created_by: 1, ingredients: Ingredient.all )
      expect(cocktail.id).to be nil

      # NO DESCRIPTION
      cocktail = Cocktail.create( name: 'Manhattan', created_by: 1, ingredients: Ingredient.all )
      expect(cocktail.id).to be nil

      # NO CREATED BY ID
      cocktail = Cocktail.create( name: 'Manhattan', description: 'ACCIO LIQUORUS!', ingredients: Ingredient.all )
      expect(cocktail.id).to be nil

      # ONLY ONE INGREDIENT
      cocktail = Cocktail.create( name: 'Manhattan', description: 'ACCIO LIQUORUS!', created_by: 1 )
      expect(cocktail.id).to be nil
    end

  end
end

def create_ingredients
  ['Rye Whiskey', 'Sweet Vermouth', 'Angostura Bitters', 'Maraschino Cherry'].each do |ingred|
    Ingredient.create( name: ingred )
  end
end
