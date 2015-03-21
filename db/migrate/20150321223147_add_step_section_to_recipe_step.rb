class AddStepSectionToRecipeStep < ActiveRecord::Migration
  def change
    add_column :recipe_steps, :step_section_id, :integer
    add_foreign_key :recipe_steps, :step_sections
    remove_foreign_key :recipe_steps, :recipes
  end
end