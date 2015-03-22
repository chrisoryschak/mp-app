class IngredientSection < ActiveRecord::Base
  belongs_to :recipe
  has_many :quantities, :dependent => :delete_all

  accepts_nested_attributes_for :quantities, :allow_destroy => true
end