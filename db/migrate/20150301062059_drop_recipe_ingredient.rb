class DropRecipeIngredient < ActiveRecord::Migration
  def up
    drop_table :recipe_ingredients
  end
end
