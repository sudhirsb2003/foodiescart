class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :category_id
      t.string :difficulty_level
      t.datetime :cooking_time
      t.text :preparation_method
      t.string :author_name
      t.integer :user_id

      t.timestamps
    end
  end
end
