class AddIngredientIdToIngredientRecipes < ActiveRecord::Migration
  def change
    add_column :ingredient_recipes, :ingredient_id, :integer
  end
end
