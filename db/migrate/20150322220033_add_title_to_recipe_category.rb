class AddTitleToRecipeCategory < ActiveRecord::Migration
  def change
    add_column :recipe_categories, :title, :string
  end
end