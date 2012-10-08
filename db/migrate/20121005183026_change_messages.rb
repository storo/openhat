class ChangeMessages < ActiveRecord::Migration
  def up
  	remove_column :messages, :sender
	remove_column :messages, :recipient
	add_column :messages, :yarn_id, :integer
	add_column :messages, :user_id, :integer
  end

  def down
  end
end
