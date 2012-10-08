class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :sender
      t.integer :recipient

      t.timestamps
    end
  end
end
