class AddCardVerificationToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :card_verification, :integer
  end
end
