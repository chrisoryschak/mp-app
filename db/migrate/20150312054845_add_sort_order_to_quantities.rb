class AddSortOrderToQuantities < ActiveRecord::Migration
  def change
    add_column :quantities, :sortOrder, :integer
  end
end
