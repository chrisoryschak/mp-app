class CreateMeasurementUnits < ActiveRecord::Migration
  def change
    create_table :measurement_units do |t|
      t.string :unit
      t.string :unitShort

      t.timestamps null: false
    end
  end
end
