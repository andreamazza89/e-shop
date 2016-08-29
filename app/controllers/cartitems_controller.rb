class CartitemsController < ApplicationController

  def create
    @product          = Product.find(params[:id])
    @cartitem         = Cartitem.new
    @cartitem.product = @product
    @cartitem.cart    = @cart

    if @cartitem.save
      respond_to :js
    else
      #deal with db failure here
    end
  end

  def destroy
    @cartitem = Cartitem.find(params[:id])
    @cartitem.destroy
    respond_to :js
  end

end
