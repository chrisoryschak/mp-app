class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  has_one :measurement_unit
  has_one :ingredient
end
