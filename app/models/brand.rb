class Brand < ActiveRecord::Base
  attr_accessible :company_name, :name
  has_many :products
  has_many :ingredients, :through=> :products
end
