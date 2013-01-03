class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :ingredient_id
      t.string :brand_id
      t.float :price

      t.timestamps
    end
  end
end
