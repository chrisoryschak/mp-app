class AddFieldsToMeasurementUnits < ActiveRecord::Migration
  def change
    add_column :measurement_units, :amount, :integer
    add_column :measurement_units, :subamount, :integer
    add_column :measurement_units, :subUnit, :string
  end
end
