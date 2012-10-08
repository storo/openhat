class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.integer :sender
      t.integer :receiver
      t.integer :tokens

      t.timestamps
    end
  end
end
