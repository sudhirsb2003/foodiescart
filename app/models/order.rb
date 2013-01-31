#require 'rubygems'
#require 'active_merchant'
class Order < ActiveRecord::Base
  attr_accessible :card_expires_on, :card_number, :card_verification, 
                  :card_name, :card_type, :cart_id, :first_name, :ip_adress,
                  :last_name, :express_token

  belongs_to :cart  

  def commision
   (product.price *(current_cart.product.commision/100))*(quantity)
  end

end 
