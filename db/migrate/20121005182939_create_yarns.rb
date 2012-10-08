class CreateYarns < ActiveRecord::Migration
  def change
    create_table :yarns do |t|

      t.timestamps
    end
  end
end
