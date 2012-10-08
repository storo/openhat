class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :description
      t.string :type
      t.integer :event_id
      t.integer :user_id
      t.integer :artist

      t.timestamps
    end
  end
end
