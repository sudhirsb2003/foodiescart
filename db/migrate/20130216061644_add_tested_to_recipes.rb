class AddTestedToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :tested, :boolean
  end
end
