class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :decsription
      t.float :calorie_value

      t.timestamps
    end
  end
end
