class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :cart_id
      t.string :ip_adress
      t.string :first_name
      t.string :last_name
      t.string :card_name
      t.string :card_type
      t.date :card_expires_on

      t.timestamps
    end
  end
end
