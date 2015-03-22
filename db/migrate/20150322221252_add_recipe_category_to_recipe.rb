class AddRecipeCategoryToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :recipe_category_id, :integer
    add_foreign_key :recipes, :recipe_categories
  end
end
