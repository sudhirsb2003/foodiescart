class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :order_id, :product_id, :quantity

  belongs_to :order
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end

 def rate
  ((product.commision/100)*(quantity)*product.price).to_s
 end

 def total_commision
   rate.sum  
 end

 

end
