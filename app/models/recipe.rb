class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipe_steps, :dependent => :destroy
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :recipe_ingredients, :allow_destroy => true
  accepts_nested_attributes_for :recipe_steps, :allow_destroy => true

end