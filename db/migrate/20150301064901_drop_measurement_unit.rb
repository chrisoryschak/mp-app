class DropMeasurementUnit < ActiveRecord::Migration
  def up
    drop_table :measurement_units
  end
end
