class AddPaperClipStage < ActiveRecord::Migration
  def up
	add_column :stages, :image_file_name, :string
	add_column :stages, :image_content_type, :string
	add_column :stages, :image_file_size, :integer
	add_column :stages, :image_updated_at, :datetime
  end

  def down
  end
end
