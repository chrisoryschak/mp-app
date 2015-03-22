class Quantity < ActiveRecord::Base
  attr_accessor :fraction

  belongs_to :ingredient_section
  belongs_to :ingredient
  accepts_nested_attributes_for :ingredient, :reject_if => :all_blank

end