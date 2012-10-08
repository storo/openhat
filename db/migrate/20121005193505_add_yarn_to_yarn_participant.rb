class AddYarnToYarnParticipant < ActiveRecord::Migration
  def change
	add_column :yarn_participants, :yarn_id, :integer
  end
end
