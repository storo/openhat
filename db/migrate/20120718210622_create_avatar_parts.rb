class CreateAvatarParts < ActiveRecord::Migration
  def change
    create_table :avatar_parts do |t|
      t.integer :avatar_id
      t.integer :section_id

      t.timestamps
    end
  end
end
