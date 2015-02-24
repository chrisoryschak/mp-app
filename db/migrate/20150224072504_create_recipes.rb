class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :cookingTime
      t.integer :defaultServings
      t.integer :prepTime
      t.string :recipeDescription
      t.string :title

      t.timestamps null: false
    end
  end
end
