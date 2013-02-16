class Recipe < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :tag_list
  paginates_per 2
 attr_accessible :author_name, :category_id, :cooking_time, :difficulty_level, :name, :photo,
                 :preparation_method, :user_id, :ingredient_recipes_attributes, :tag_list

 has_many :ingredient_recipes
 belongs_to :category
 belongs_to :user
 accepts_nested_attributes_for :ingredient_recipes
 # before_create :product_empty
 validates :author_name, :presence => true
 

  extend FriendlyId
  friendly_id :name, use: :slugged
   
 # def product_empty
 #   if products.empty?
 #     errors.add(:base, 'Products not  present in database ')
 #   end 
 # end

 LEVELS = %w[Easy Difficult Very_Difficult]

has_attached_file :photo,
     :styles => {
       :thumb=> "100x100#",
       :small  => "400x400>" }


def self.search(search)
  #if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  #else
   # find(:all)
  #end
end




end
