class AddRecipeIdToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :recipe_id, :integer
  end
end
