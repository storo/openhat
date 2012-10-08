class CreateMyTokens < ActiveRecord::Migration
  def change
    create_table :my_tokens do |t|
      t.integer :amount
      t.integer :user_id
      t.string :operation
      t.integer :payment_id

      t.timestamps
    end
  end
end
