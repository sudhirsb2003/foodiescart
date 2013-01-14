class OrdersController < InheritedResources::Base

  def new
    @order = Order.new
  end
  
  def create
    @order = Order.create!(params[:order])
    @order.cart_id = "#{current_cart}"
    if @order.save
      if @order.purchase
        render :action => "success"
      else
        render :action => "failure"
      end
    else
      render :action => 'new'
    end
  end


end
