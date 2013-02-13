class OrdersController < ApplicationController
  before_filter :current_cart

  def index
   #@orders = Order.all
   #@orders = Order.page(params[:page])
   @orders = Kaminari.paginate_array(Order.all).page(params[:page])
   last_page = @orders.num_pages
  end

  def show
   @order = Order.find(params[:id])
  end

#  def express
#    response = EXPRESS_GATEWAY.setup_purchase(current_cart.build_order.price_in_cents,
#      :ip                => request.remote_ip,
#      :return_url        => new_order_url,
#      :cancel_return_url => products_url
#    )
#    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
#  end
  
  def new
    @order = Order.new(:express_token => params[:token])
  end
  
  def create
    @order = Order.create(params[:order])
    @order.cart = Cart.find(session[:cart_id])
    @order.ip_adress = request.remote_ip
    @order.save
     if @order.save
       current_cart.line_items.each do |e|
      @wallet = Wallet.create(params[:wallet])
       @wallet.order_id = @order.id
       @wallet.cart_id = current_cart.id
       @wallet.commission = @order.total_commision.to_s
       @wallet.user_id = e.product.user_id
      @wallet.save
     end
end
    #ReceiptsMailer.purchase_confirmation(@order).deliver
    reset_session
    redirect_to order_path(@order), :notice => "Thank you , Your Order has Completed Successfully."
  end

end
