class ChangeStageToTips < ActiveRecord::Migration
  def up
	change_column :tips, :stage_id, :string
  end

  def down
  end
end
