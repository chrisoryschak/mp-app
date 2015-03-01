class RemoveFieldsFromRecipeIngredients < ActiveRecord::Migration
  def change
    remove_column :recipe_ingredients, :amount, :integer
    remove_column :recipe_ingredients, :fraction, :float
  end
end
