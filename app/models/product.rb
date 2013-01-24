class Product < ActiveRecord::Base
  attr_accessible :brand_id, :ingredient_id, :price, :photo, :ingredient_name,:commision
  belongs_to :brand
  belongs_to :ingredient


  has_attached_file :photo,
     :styles => {
       :thumb=> "100x100",
       :small  => "400x400",
       :large => "800x600" }


  default_scope :order => 'price'
  has_many :line_items
  has_many :orders, :through => :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  #validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  #validates :title, :uniqueness => true
  #validates :image_url, :format => {
  #  :with => %r{\.(gif|jpg|png)$}i,
  #  :message => 'must be a URL for GIF, JPG or PNG image.'
  #}
  private
  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end

  
 def brand_name 
    brand.name if brand
  end

  def brand_name=(name)
   self.brand = Brand.find_or_create_by_name(name) unless name.blank?
  end

def ingredient_name
    ingredient.name if ingredient
  end

  def ingredient_name=(name)
   self.ingredient = Ingredient.find_or_create_by_name(name) unless name.blank?
  end


end
 
