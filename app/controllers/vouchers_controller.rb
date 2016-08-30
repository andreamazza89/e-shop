class VouchersController < ApplicationController

  def create

    if @discount = Voucher.validate_voucher(params[:code], session[:cart_id])
      session[:discounts].nil? ? session[:discounts] = @discount : session[:discounts] += @discount
      respond_to :js
    else
      p '++++++++++++++++++++++++++'
      #notify voucher not valid
      flash[:notice] = 'Invalid voucher'
      render plain: 'invalid voucher'
    end
  end

end
