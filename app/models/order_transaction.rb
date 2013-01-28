class OrderTransaction < ActiveRecord::Base
  attr_accessible :action, :amount, :authoriation, :message, :order_id, :params, :success,:recipe_id ,:cart_id     
end
