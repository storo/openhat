class CreateMessageReadStates < ActiveRecord::Migration
  def change
    create_table :message_read_states do |t|
      t.integer :message_id
      t.integer :user_id

      t.timestamps
    end
  end
end
