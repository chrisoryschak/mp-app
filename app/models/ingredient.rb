class Ingredient < ActiveRecord::Base

  has_many :quantities, :dependent => :destroy
  has_many :ingredient_sections, through: :quantities

end