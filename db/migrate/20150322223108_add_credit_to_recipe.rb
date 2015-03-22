class AddCreditToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :credit, :string
  end
end
