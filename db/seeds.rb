# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cocktail.delete_all
Ingredient.delete_all

c1 = Cocktail.new( name: 'Manhattan', description: 'Place ice in a mixing glass. Pour in 1/2 oz vermouth, 2oz then whiskey, and stir.
  Strain into a cocktail glass. Add a dash of bitters if desired, and garnish with a cherry.', created_by: 1 )
['Rye Whiskey', 'Sweet Vermouth', 'Angostura Bitters', 'Maraschino Cherry'].each do |ingred|
  c1.ingredients << Ingredient.find_or_create_by_name( name: ingred.titleize )
end
c1.save

c2 = Cocktail.new( name: 'Old Fashioned',
  description: 'Mix 1 tsp sugar, 1 splash water and 2 dashes angostura bitters in an old-fashioned glass. Drop in a cherry and an
  orange wedge. Muddle into a paste using a muddler or the back end of a spoon. Pour in 2oz bourbon, fill with ice cubes, and stir.',
  created_by: 2 )
['Bourbon Whiskey', 'Sugar', 'Orange Wedge', 'Angostura Bitters', 'Maraschino Cherry'].each do |ingred|
  c2.ingredients << Ingredient.find_or_create_by_name( name: ingred.titleize )
end
c2.save

c3 = Cocktail.new( name: 'Whiskey Sour',
  description: 'Pour 1 1/2 oz whiskey, 1 1/2 oz lemon juice, and 3/4 oz sugar syrup into a cocktail shaker with ice cubes. Shake well.
  Strain into a chilled sour glass. Garnish with the cherry.',
  created_by: 2 )
['Rye Whiskey', 'Sugar Syrup', 'Lemon Juice', 'Maraschino Cherry'].each do |ingred|
  c3.ingredients << Ingredient.find_or_create_by_name( name: ingred.titleize )
end
c3.save
