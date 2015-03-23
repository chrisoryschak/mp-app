class RecipeCategory < ActiveRecord::Base
  has_many :recipes, :dependent => :nullify
end
