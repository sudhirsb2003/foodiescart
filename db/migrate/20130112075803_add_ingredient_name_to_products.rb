class AddIngredientNameToProducts < ActiveRecord::Migration
  def change
    add_column :products, :ingredient_name, :string
  end
end
