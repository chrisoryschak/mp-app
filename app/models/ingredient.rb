class Ingredient < ActiveRecord::Base

  has_many :quantities
  has_many :ingredient_sections, through: :quantities

end