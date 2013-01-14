class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :ingredient_id
      t.integer :brand_id
      t.float :price

      t.timestamps
    end
  end
end
