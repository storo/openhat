class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
