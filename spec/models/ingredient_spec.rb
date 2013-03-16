# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Ingredient do
  describe '.new' do
    it 'should create an instance of ingredient' do
      ingredient = Ingredient.new
      expect(ingredient).to be_an_instance_of(Ingredient)
    end
  end

  describe '.create' do
    it 'should save a new ingredient to the database' do
      ingredient = Ingredient.create( name: 'Rye Whiskey' )
      expect(ingredient.id).to_not be nil
    end

    it 'should NOT save a new ingredient to the database if it does not have a name' do
      ingredient = Ingredient.create
      expect(ingredient.id).to be nil
    end
  end
end
