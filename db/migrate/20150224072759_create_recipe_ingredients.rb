class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.integer :amount
      t.float :fraction
      t.string :preparation
      t.references :recipe, index: true
      t.references :measurement_unit, index: true

      t.timestamps null: false
    end
    add_foreign_key :recipe_ingredients, :recipes
    add_foreign_key :recipe_ingredients, :measurement_units
  end
end
