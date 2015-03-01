class CreateQuantities < ActiveRecord::Migration
  def change
    create_table :quantities do |t|
      t.float :primaryamount
      t.string :primaryunit
      t.float :secondaryamount
      t.string :secondaryunit
      t.references :recipe, index: true
      t.references :ingredient, index: true

      t.timestamps null: false
    end
    add_foreign_key :quantities, :recipes
    add_foreign_key :quantities, :ingredients
  end
end
