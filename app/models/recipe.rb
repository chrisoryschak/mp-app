class Recipe < ActiveRecord::Base
  # attr_accessible :title, :recipeDescription, :prepTime, :cookingTime, :defaultServings, :quantities_attributes

  has_many :recipe_steps, :dependent => :destroy
  has_many :quantities, :dependent => :destroy
  has_many :ingredients,
           :through => :quantities

  accepts_nested_attributes_for :recipe_steps, :allow_destroy => true
  accepts_nested_attributes_for :quantities, :allow_destroy => true
  accepts_nested_attributes_for :ingredients

end