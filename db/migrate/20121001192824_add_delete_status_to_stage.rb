class AddDeleteStatusToStage < ActiveRecord::Migration
  def change
	add_column :stages, :delete_status, :integer

  end
end
