class OrderTransactionsController < InheritedResources::Base
def transact 
   @transacation = OrderTransaction.new
  @transaction = OrderTransaction.new(params[:transaction])
  @cart = Cart.find(params[:current_cart])
  @transaction = OrderTransaction.create(params[:transaction])
  @transaction.cart =  @cart.id 
  @transaction.save
  redirect_to new_order_path
    
end


end






