class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :status
      t.float :amount
      t.string :transaction_number
      t.integer :order_id

      t.timestamps
    end
  end
end
