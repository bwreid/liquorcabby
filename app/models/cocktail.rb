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
#

class Cocktail < ActiveRecord::Base
  attr_accessible :created_by, :description, :name, :ingredients
  has_and_belongs_to_many :ingredients
  validates :name, :description, :created_by, :presence => true
  validate :two_or_more_ingredients, :on => :create

  private

  def two_or_more_ingredients
    errors.add(:ingredients, "Must have two or more ingredients!") if self.ingredients.length < 2
  end
end
