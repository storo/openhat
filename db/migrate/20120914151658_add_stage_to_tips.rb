class AddStageToTips < ActiveRecord::Migration
  def change
	add_column :tips, :stage_id, :integer

  end
end
