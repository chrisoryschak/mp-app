class AddIngredientRefsToRecipeIngredients < ActiveRecord::Migration
  def change
    add_reference :recipe_ingredients, :ingredient, index: true
    add_foreign_key :recipe_ingredients, :ingredients
  end
end
