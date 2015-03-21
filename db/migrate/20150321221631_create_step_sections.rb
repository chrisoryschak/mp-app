class CreateStepSections < ActiveRecord::Migration
  def change
    create_table :step_sections do |t|
      t.string :title
      t.references :recipe, index: true

      t.timestamps null: false
    end
    add_foreign_key :step_sections, :recipes
  end
end
