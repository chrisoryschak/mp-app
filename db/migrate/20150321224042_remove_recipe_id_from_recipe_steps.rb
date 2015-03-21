class RemoveRecipeIdFromRecipeSteps < ActiveRecord::Migration
  def change
    remove_column :recipe_steps, :recipe_id, :integer
  end
end
