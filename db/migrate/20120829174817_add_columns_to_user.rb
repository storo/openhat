class AddColumnsToUser < ActiveRecord::Migration
  def change
	add_column :users, :gender,:string
	add_column :users, :interest, :string
	add_column :users, :birthdate, :string
	add_column :users, :hometown, :string
  end
end
