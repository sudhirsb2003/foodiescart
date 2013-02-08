class AddCheckedOutAtToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :checked_out_at, :time
  end
end
