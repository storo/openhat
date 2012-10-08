class AddUsertoStages < ActiveRecord::Migration
  def up
    add_column :stages, :user_id, :integer
  end

  def down
  end
end
