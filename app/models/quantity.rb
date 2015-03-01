class Quantity < ActiveRecord::Base
  # attr_accessible :primaryamount, :primaryunit, :secondaryamount, :secondaryunit, :ingredient_attributes

  belongs_to :recipe
  belongs_to :ingredient

  accepts_nested_attributes_for :ingredient
end