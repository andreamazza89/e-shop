class ProductsController < ApplicationController
  def index
    @products  = Product.all
    @cartitems = Cartitem.where(cart_id: session[:cart_id])
  end
end
