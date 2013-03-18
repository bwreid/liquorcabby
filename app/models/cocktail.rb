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

class Cocktail < ActiveRecord::Base
  attr_accessible :created_by, :description, :name, :ingredients, :image, :rank
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :users

  validates :name, :description, :created_by, :presence => true
  validate :two_or_more_ingredients, :on => :create

  def shake_and_save(user_id, params)
    self.created_by = user_id
    params.split(', ').each { |ingred| self.ingredients << Ingredient.find_or_create_by_name( ingred ) }
    self.save
    User.find(user_id).cocktails << self
  end

  private

  def two_or_more_ingredients
    errors.add(:ingredients, "Must have two or more ingredients!") if self.ingredients.length < 2
  end

end
