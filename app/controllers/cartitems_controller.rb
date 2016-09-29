class CartitemsController < ApplicationController

  def create
    @product = Product.find(params[:id])
    if @product.stock_quantity <= 0
      render plain: 'cannot add to cart: not availbale in stock'
    else
      create_or_update_cartitem
      respond_to :js
    end
  end

  def destroy
    @cartitem = Cartitem.find(params[:id])

    product = @cartitem.product
    product.stock_quantity += @cartitem.quantity
    product.save

    @cartitem.destroy
    respond_to :js
  end

  private
  
  def create_or_update_cartitem
    @cartitem = @cart.cartitems.where(product_id: @product.id).first_or_create 
    @cartitem.quantity += 1
    @cartitem.save

    product = @cartitem.product
    product.stock_quantity -= 1
    product.save
  end

end
