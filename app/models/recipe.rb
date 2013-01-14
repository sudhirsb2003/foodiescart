class Recipe < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :tag_list
  paginates_per 2
 attr_accessible :author_name, :category_id, :cooking_time, :difficulty_level, :name, :photo,
                 :preparation_method, :user_id, :ingredient_recipes_attributes, :tag_list

 has_many :ingredient_recipes
 belongs_to :category
 accepts_nested_attributes_for :ingredient_recipes

  extend FriendlyId
  friendly_id :name, use: :slugged

has_attached_file :photo,
     :styles => {
       :thumb=> "100x100#",
       :small  => "400x400>" }


end


