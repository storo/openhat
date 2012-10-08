class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.string :account
      t.integer :user_id
      t.string :city
      t.string :address
      t.string :state
      t.string :country
      t.string :zip

      t.timestamps
    end
  end
end
