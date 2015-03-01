class RemoveIngredientIdFromRecipeIngredients < ActiveRecord::Migration
  def change
    remove_column :recipe_ingredients, :ingredient_id, :integer
  end
end
