class AddProductIdToOrderTransaction < ActiveRecord::Migration
  def change
    add_column :order_transactions, :product_id, :integer
  end
end
