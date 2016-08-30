class CreateVouchers < ActiveRecord::Migration[5.0]
  def change
    create_table :vouchers do |t|
      t.integer :discount
      t.string :description

      t.timestamps
    end
  end
end
