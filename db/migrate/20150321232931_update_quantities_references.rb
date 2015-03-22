class UpdateQuantitiesReferences < ActiveRecord::Migration
  def change
    add_column :quantities, :ingredient_section_id, :integer
    add_foreign_key :quantities, :ingredient_sections

    remove_foreign_key :quantities, :recipes
    remove_column :quantities, :recipe_id, :integer
  end
end