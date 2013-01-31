class Wallet < ActiveRecord::Base
  attr_accessible :cart_id, :commission, :order_id
end
