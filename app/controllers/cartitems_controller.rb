class CartitemsController < ApplicationController

  def index
    
  end

  def create

    @product = Product.find(params[:id])
    @cartitem = Cartitem.new
    @cartitem.product = @product
    @cartitem.cart = Cart.find(session[:cart_id])
    @cartitem.save
   
    respond_to do |format|
      format.js {}
    end
  end

end
