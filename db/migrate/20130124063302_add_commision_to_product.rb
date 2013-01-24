class AddCommisionToProduct < ActiveRecord::Migration
  def change
    add_column :products, :commision, :float
  end
end
