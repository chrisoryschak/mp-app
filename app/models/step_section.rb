class StepSection < ActiveRecord::Base
  belongs_to :recipe
  has_many :recipe_steps, :dependent => :delete_all

  accepts_nested_attributes_for :recipe_steps, :allow_destroy => true
end