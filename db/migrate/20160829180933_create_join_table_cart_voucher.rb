class CreateJoinTableCartVoucher < ActiveRecord::Migration[5.0]
  def change
    create_join_table :carts, :vouchers do |t|
      # t.index [:cart_id, :voucher_id]
      # t.index [:voucher_id, :cart_id]
    end
  end
end
