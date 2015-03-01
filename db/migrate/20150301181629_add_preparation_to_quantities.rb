class AddPreparationToQuantities < ActiveRecord::Migration
  def change
    add_column :quantities, :preparation, :string
  end
end
