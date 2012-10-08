class ChangeLeaderToFollowers < ActiveRecord::Migration
  def up
    change_column :followers, :leader, :string
  end

  def down
  end
end
