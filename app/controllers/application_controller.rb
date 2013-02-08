class ApplicationController < ActionController::Base
  protect_from_forgery

  #before_filter :authenticate_user!

  helper_method :current_cart

#  rescue_from CanCan::AccessDenied do |exception|
#    redirect_to root_url, :alert => exception.message
#  end

#  def current_ability
#    @current_ability ||= Ability.new(current_admin_user)
#  end 

  def current_cart
     Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
     session[:cart_id] = cart.id
    cart
  end

#  def check_user_role
#   redirect_to root_path unless current_user.role == "admin"
#  end

end
