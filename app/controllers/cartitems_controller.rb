class CartitemsController < ApplicationController

  def create
    @product = Product.find(params[:id])

    if @product.stock_quantity <= 0
      render plain: 'cannot add to cart: not availbale in stock'
    else
      create_or_update_cartitem
    end
  end

  def destroy
    @cartitem = Cartitem.find(params[:id])
    @cartitem.destroy
    respond_to :js
  end

  private
  
  def create_or_update_cartitem
    if Cartitem.any? { |item| item.product == @product }
      existing_cartitem_id = Cartitem.where(product_id: @product.id)[0].id
      @cartitem = Cartitem.update(existing_cartitem_id, quantity: 2) 
      respond_to :js
    else
      @cartitem          = Cartitem.new
      @cartitem.product  = @product
      @cartitem.cart     = @cart
      @cartitem.quantity = 1

      if @cartitem.save
        respond_to :js
      else
        render plain: 'cannot add to cart: something went wrong'
      end
    end
  end

end
