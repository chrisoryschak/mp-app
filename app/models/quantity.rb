class Quantity < ActiveRecord::Base
  attr_accessor :fraction
  before_create :calculate_amount
  before_update :calculate_amount

  def calculate_amount
    # Before creating a new ingredient for a recipe, check for a value in the fraction field. If so,
    # combine it into the primary amount field
    #["Whole","1/16", "1/8", "1/4", "1/3", "1/2", "2/3","3/4"]
    case self.fraction
      when "1/16"
        self.primaryamount = self.primaryamount + 0.0625
      when "1/8"
        self.primaryamount = self.primaryamount + 0.125
      when "1/4"
        self.primaryamount = self.primaryamount + 0.25
      when "1/3"
        self.primaryamount = self.primaryamount + 0.333
      when "1/2"
        self.primaryamount = self.primaryamount + 0.5
      when "2/3"
        self.primaryamount = self.primaryamount + 0.666
      when "3/4"
        self.primaryamount = self.primaryamount + 0.75
    end

  end

  belongs_to :recipe
  belongs_to :ingredient
  accepts_nested_attributes_for :ingredient, :reject_if => :all_blank

end