require 'spec_helper'

describe 'Cocktail Controller' do

  let(:user) {User.create(email: 'xavier@gmail.com', name: 'Xavier', password: 'a', password_confirmation: 'a')}
  let(:user2) {User.create(email: 'mary@gmail.com', name: 'Mary', password: 'a', password_confirmation: 'a')}

  describe 'GET /cocktails' do
    it 'should go to the cocktail index page and see a list of user cocktails', :js => true do
      visit root_path
      click_link('Login')
      fill_in('email', :with => user.email)
      fill_in('Password', :with => 'a')

      create_ingredients
      create_cocktails
      click_button('Start Drinking')

      page.first('div.cocktail h3').text.should eq 'MANHATTAN'
      page.first('div.cocktail a.star')
      page.first('div.cocktail a.created_by')
    end

    it 'should have a new cocktail form', :js => true do
      visit root_path
      click_link('Login')
      fill_in('email', :with => user.email)
      fill_in('Password', :with => 'a')

      create_ingredients
      create_cocktails
      click_button('Start Drinking')

      page.should have_xpath('//a[@href = "/cocktails/new"]')
      page.find(:xpath, '//a[@href = "/cocktails/new"]').click
      page.should have_text('Cancel')
    end
  end

  describe 'GET /cocktails/top_rated' do
    it 'should go to the top rated page and show the cocktails ordered by rank', :js => true do
      visit root_path
      click_link('Login')
      fill_in('email', :with => user.email)
      fill_in('Password', :with => 'a')

      create_ingredients
      create_cocktails
      click_button('Start Drinking')

      visit top_rated_cocktails_path
      page.first('.cocktail h3').text.should eq 'OLD FASHIONED'

    end
  end

  describe 'GET /cocktails/favorites' do
    it 'should go to the favorites page and show favorite cocktails', :js => true do
      visit root_path
      click_link('Login')
      fill_in('email', :with => user.email)
      fill_in('Password', :with => 'a')

      create_ingredients
      create_cocktails
      user.cocktails << Cocktail.first
      click_button('Start Drinking')

      visit favorites_cocktails_path
      page.first('.cocktail h3').text.should eq 'MANHATTAN'
    end
  end

  describe 'POST /cocktails' do
    it 'should create a new cocktail', :js => true do
      visit root_path
      click_link('Login')
      fill_in('email', :with => user.email)
      fill_in('Password', :with => 'a')

      create_ingredients
      create_cocktails
      click_button('Start Drinking')

      page.find(:xpath, '//a[@href = "/cocktails/new"]').click
      fill_in('cocktail_name', :with => 'X')
      fill_in('tags', :with => 'A, B, C')
      fill_in('cocktail_image', :with => '/assets/default.jpg')
      fill_in('cocktail_description', :with => 'EFG')
      click_button('Create Cocktail')
      page.should have_text 'X'
    end
  end

  describe 'SHOW /cocktails/1', :js => true do
    it 'should go to the cocktail page which should also include a description' do
      visit root_path
      click_link('Login')
      fill_in('email', :with => user.email)
      fill_in('Password', :with => 'a')

      create_ingredients
      create_cocktails
      click_button('Start Drinking')

      click_link('Manhattan')
      page.should have_text 'MANHATTAN'
      page.should have_text 'RYE WHISKEY'
      page.should have_text 'ACCIO LIQUORUS!'
      page.first('.cocktail a.star')
      page.first('.cocktail a.created_by')
    end
  end
end

def create_ingredients
  ['Rye Whiskey', 'Sweet Vermouth', 'Angostura Bitters', 'Maraschino Cherry'].each do |ingred|
    Ingredient.create( name: ingred )
  end
end

def create_cocktails
  Cocktail.create( name: 'Manhattan', description: 'ACCIO LIQUORUS!', rank: 0, created_by: user2.id, ingredients: Ingredient.all )
  Cocktail.create( name: 'Old Fashioned', description: 'ACCIO LIQUORUS!', rank: 1, created_by: user.id, ingredients: Ingredient.all )
end
