class Recipe < ActiveRecord::Base
  belongs_to :recipe_category
  has_many :ingredient_sections, :dependent => :destroy
  has_many :step_sections, :dependent => :destroy
  has_many :quantities,
           :through => :ingredient_sections

  accepts_nested_attributes_for :ingredient_sections, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :step_sections, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :quantities, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :recipe_category, allow_destroy: false

end