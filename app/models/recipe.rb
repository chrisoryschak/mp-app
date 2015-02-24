class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipe_steps
end
