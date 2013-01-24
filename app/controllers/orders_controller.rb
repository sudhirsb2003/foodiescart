class OrdersController < ApplicationController
  def express
    response = EXPRESS_GATEWAY.setup_purchase(current_cart.build_order.price_in_cents,
      :ip                => request.remote_ip,
      :return_url        => new_order_url,
      :cancel_return_url => products_url
    )
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end
  
  def new
    @order = Order.new(:express_token => params[:token])
  end
  
  def create
    @order = current_cart.orders.build(params[:order])
    @order.ip_adress = request.remote_ip
    if @order.save
      if @order.purchase
        redirect_to root_url
      else
        render :action => "failure"
      end
    else
      render :action => 'new'
    end
  end
end
