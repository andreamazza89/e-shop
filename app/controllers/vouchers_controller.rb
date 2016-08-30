class VouchersController < ApplicationController

  def create
    if discount = Voucher.validate_voucher(params[:voucher], session[:cart_id], session[:discount])
      session[:discount] += discount
      respond_to :js
    else
      #notify failed voucher
    end
  end

end
