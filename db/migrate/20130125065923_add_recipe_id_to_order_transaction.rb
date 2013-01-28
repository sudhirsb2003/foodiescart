class AddRecipeIdToOrderTransaction < ActiveRecord::Migration
  def change
    add_column :order_transactions, :recipe_id, :integer
  end
end
