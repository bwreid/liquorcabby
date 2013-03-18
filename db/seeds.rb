# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Cocktail.delete_all
Ingredient.delete_all

u1 = User.create( :name => 'bryan', :email => 'x', :password => 'x', :password_confirmation => 'x' )
u2 = User.create( :name => 'shefali', :email => 'y', :password => 'y', :password_confirmation => 'y' )

c1 = Cocktail.new( name: 'Manhattan',  rank: 15, :image => '/assets/manhattan.jpg', description: 'Place ice in a mixing glass. Pour in 1/2 oz vermouth, 2oz then whiskey, and stir.
  Strain into a cocktail glass. Add a dash of bitters if desired, and garnish with a cherry.', created_by: u1.id )
['Rye Whiskey', 'Sweet Vermouth', 'Angostura Bitters', 'Maraschino Cherry'].each do |ingred|
  c1.ingredients << Ingredient.find_or_create_by_name( name: ingred.titleize )
end
c1.save
u1.cocktails << c1

c2 = Cocktail.new( name: 'Old Fashioned',
  description: 'Mix 1 tsp sugar, 1 splash water and 2 dashes angostura bitters in an old-fashioned glass. Drop in a cherry and an
  orange wedge. Muddle into a paste using a muddler or the back end of a spoon. Pour in 2oz bourbon, fill with ice cubes, and stir.',
  created_by: u1.id )
['Bourbon Whiskey', 'Sugar', 'Orange Slices', 'Angostura Bitters', 'Maraschino Cherry'].each do |ingred|
  c2.ingredients << Ingredient.find_or_create_by_name( name: ingred.titleize )
end
c2.save
u1.cocktails << c2

c3 = Cocktail.new( name: 'Whiskey Sour', rank: 5, image: '/assets/classy.jpg',
  description: 'Pour 1 1/2 oz whiskey, 1 1/2 oz lemon juice, and 3/4 oz sugar syrup into a cocktail shaker with ice cubes. Shake well.
  Strain into a chilled sour glass. Garnish with the cherry.',
  created_by: u2.id )
['Rye Whiskey', 'Sugar Syrup', 'Lemon Juice', 'Maraschino Cherry'].each do |ingred|
  c3.ingredients << Ingredient.find_or_create_by_name( name: ingred.titleize )
end
c3.save
u2.cocktails << c3

c4 = Cocktail.new( name: 'Blackberry Gin Fizz', rank: 12,  image: '/assets/blackberry.jpg',
  description: '1 tablespoon lime juice, 2 oz gin, and 1/3 of the torn mint leaves into a cocktail shaker filled with ice, and shake until cold. Pour into
  two 8-ounce glasses, and add 1/4 cup seltzer to each. Repeat twice. Garnish with berries and mint sprigs.',
  created_by: u2.id )
['Blackberries', 'Sugar', 'Lime Juice', 'Gin', 'Seltzer'].each do |ingred|
  c4.ingredients << Ingredient.find_or_create_by_name( name: ingred.titleize )
end
c4.save
u2.cocktails << c4

c5 = Cocktail.new( name: 'Blackberry Sangria', rank: 16,  image: '/assets/murky.jpg',
  description: "Pour wine into a large pitcher. Squeeze the juice wedges from the lemon, orange and lime into the wine. Toss in everything but ginger ale. Chill overnight. Add ginger ale, berries and ice just before serving.",
  created_by: u2.id )
['Red Wine', 'Lemon Slices', 'Orange Slices', 'Lime Slices', 'Sugar', 'Orange Juice', 'Gin', 'Triple Sec', 'Raspberries', 'Ginger Ale', 'Pineapple'].each do |ingred|
  c5.ingredients << Ingredient.find_or_create_by_name( name: ingred.titleize )
end
c5.save
u2.cocktails << c5

c6 = Cocktail.new( name: 'Spiced Pineapple Cocktail', rank: 14,  image: '/assets/tequila.jpg',
  description: "Stir lime juice and agave nectar; add to blender, with pineapple juice, pineapple, triple sec, tequila, and ice. Blend. Combine chili powder, sugar, and salt. Rub a lime wedge around rims of glasses, then dip glasses in spice mix to coat.",
  created_by: u2.id )
['Tequila', 'Pineapple Juice', 'Honey', 'Lime Juice', 'Chili Powder', 'Sugar', 'Salt', 'Triple Sec'].each do |ingred|
  c6.ingredients << Ingredient.find_or_create_by_name( name: ingred.titleize )
end
c6.save
u2.cocktails << c4
