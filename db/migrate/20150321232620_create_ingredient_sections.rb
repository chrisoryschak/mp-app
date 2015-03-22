class CreateIngredientSections < ActiveRecord::Migration
  def change
    create_table :ingredient_sections do |t|
      t.string :title
      t.references :recipe, index: true

      t.timestamps null: false
    end
    add_foreign_key :ingredient_sections, :recipes
  end
end
