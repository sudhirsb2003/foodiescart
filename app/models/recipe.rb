class Recipe < ActiveRecord::Base
 attr_accessible :author_name, :category, :cooking_time, :difficulty_level, :name, :photo,
                 :preparation_method, :user_id, :ingredient_recipes_attributes

 has_many :ingredient_recipes
 accepts_nested_attributes_for :ingredient_recipes

has_attached_file :photo,
     :styles => {
       :thumb=> "100x100#",
       :small  => "400x400>" }


end


