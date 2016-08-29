class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :connect_cart

  def connect_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

end
