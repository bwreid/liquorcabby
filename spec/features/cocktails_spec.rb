require 'spec_helper'

describe 'Cocktail Controller' do
  describe 'GET /cocktails' do
    it 'should go to the cocktail index page and see a list of user cocktails' do
      create_ingredients
      create_cocktails
      visit cocktails_path
      page.first('div.cocktail h3').text.should eq 'Manhattan'
      page.first('div.cocktail h6').text.should eq 'Rye Whiskey'
      page.first('div.cocktail a.star')
      page.first('div.cocktail a.created_by')
    end

    it 'should have a new cocktail form' do
      visit cocktails_path
      page.should have_xpath('//a[@href = "/cocktails/new"]')
      page.find(:xpath, '//a[@href = "/cocktails/new"]').click
      page.should have_text('Create Cocktail')
    end
  end

  describe 'POST /cocktails' do
    it 'should create a new cocktail' do

    end
  end

  describe 'SHOW /cocktails/1' do
    it 'should go to the cocktail page which should also include a description' do
      create_ingredients
      create_cocktails
      visit cocktails_path
      click_link('Manhattan')
      page.first('div.cocktail h3').text.should eq 'Manhattan'
      page.first('div.cocktail h6').text.should eq 'Rye Whiskey'
      page.first('div.cocktail p').text.should eq 'ACCIO LIQUORUS!'
      page.first('div.cocktail a.star')
      page.first('div.cocktail a.created_by')
    end
  end
end

def create_ingredients
  ['Rye Whiskey', 'Sweet Vermouth', 'Angostura Bitters', 'Maraschino Cherry'].each do |ingred|
    Ingredient.create( name: ingred )
  end
end

def create_cocktails
  Cocktail.create( name: 'Manhattan', description: 'ACCIO LIQUORUS!', created_by: 1, ingredients: Ingredient.all )
end
