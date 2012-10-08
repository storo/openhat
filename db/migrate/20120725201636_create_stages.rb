class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.string :type
      t.integer :category_id
      t.integer :sub_category_id
      t.string :room_name
      t.string :language_content
      t.string :rate
      t.string :status

      t.timestamps
    end
  end
end
