class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :name
      t.integer :quantity
      t.float :price
      t.boolean :status

      t.timestamps
    end
  end
end
