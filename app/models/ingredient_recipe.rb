class IngredientRecipe < ActiveRecord::Base
  attr_accessible :ingredient_name, :recipe_id, :ingredient_id
  belongs_to :recipe
  belongs_to :ingredient

  def ingredient_name
    ingredient.name if ingredient
  end

  def ingredient_name=(name)
   self.ingredient = Ingredient.find_or_create_by_name(name) unless name.blank?
  end


end
