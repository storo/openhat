class ChangeTYpetoStage < ActiveRecord::Migration
  def up
	rename_column :stages, :type, :types  
end

  def down
  end
end
