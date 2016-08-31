class CartitemsController < ApplicationController

  def create
    @product = Product.find(params[:id])

    if @product.stock_quantity <= 0
      render plain: 'cannot add to cart: not availbale in stock'
    else
      @cartitem         = Cartitem.new
      @cartitem.product = @product
      @cartitem.cart    = @cart

      if @cartitem.save
        respond_to :js
      else
        render plain: 'cannot add to cart: something went wrong'
      end
    end
  end

  def destroy
    @cartitem = Cartitem.find(params[:id])
    @cartitem.destroy
    respond_to :js
  end

end
