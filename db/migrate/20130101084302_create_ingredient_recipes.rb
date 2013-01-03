class CreateIngredientRecipes < ActiveRecord::Migration
  def change
    create_table :ingredient_recipes do |t|
      t.integer :recipe_id
      t.string :ingredient_name

      t.timestamps
    end
  end
end
