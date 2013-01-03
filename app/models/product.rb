class Product < ActiveRecord::Base
  attr_accessible :brand_name, :ingredient_name, :price  
  belongs_to :brand
  belongs_to :ingredient

  
 def brand_name 
    brand.name if brand
  end

  def brand_name=(name)
   self.brand = Brand.find_or_create_by_name(name) unless name.blank?
  end

def ingredient_name
    ingredient.name if ingredient
  end

  def ingredient_name=(name)
   self.ingredient = Ingredient.find_or_create_by_name(name) unless name.blank?
  end


end
 
