class Wallet < ActiveRecord::Base
  attr_accessible :cart_id, :commission, :order_id

  def total_commision
   puts rate.sum  
  end


end
