class ModParentToSections < ActiveRecord::Migration
  def up
    change_column :sections, :parent, :string
  end

  def down
  end
end
