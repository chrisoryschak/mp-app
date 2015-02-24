class CreateRecipeSteps < ActiveRecord::Migration
  def change
    create_table :recipe_steps do |t|
      t.string :stepInstructions
      t.integer :stepNumber
      t.references :recipe, index: true

      t.timestamps null: false
    end
    add_foreign_key :recipe_steps, :recipes
  end
end
