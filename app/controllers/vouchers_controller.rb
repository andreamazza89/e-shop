class VouchersController < ApplicationController

  def create
    if discount = Voucher.validate_voucher(params[:voucher], session[:cart_id], session[:discount])
      session[:discount] += discount
      respond_to :js
    else
      respond_to do |format| 
        format.js { render 'invalid_voucher' }
      end
    end
  end

end
