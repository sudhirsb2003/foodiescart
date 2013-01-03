class Ingredient < ActiveRecord::Base
  attr_accessible :calorie_value, :decsription, :name, :brand_ids

  has_many :products
  has_many :brands, :through => :products
end
