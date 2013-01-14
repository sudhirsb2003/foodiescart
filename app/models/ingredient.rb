class Ingredient < ActiveRecord::Base
  attr_accessible :calorie_value, :decsription, :name, :brand_ids
  validates_presence_of :name
  validates_uniqueness_of :name, :message => "Name has already been taken"
  has_many :products
  has_many :brands, :through => :products
end
