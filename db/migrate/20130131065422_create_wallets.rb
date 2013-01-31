class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.integer :order_id
      t.integer :cart_id
      t.float :commission

      t.timestamps
    end
  end
end
