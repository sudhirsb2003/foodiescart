class CartsController < ApplicationController
  def show
    @cart = current_cart
        @transaction = OrderTransaction.new

end 


  
  

  end
