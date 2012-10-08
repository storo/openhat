class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :parent
      t.string :img_front
      t.string :img_back
      t.boolean :free
      t.string :gender
      t.string :group

      t.timestamps
    end
  end
end
