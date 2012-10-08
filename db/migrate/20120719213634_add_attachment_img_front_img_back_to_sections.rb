class AddAttachmentImgFrontImgBackToSections < ActiveRecord::Migration
  def self.up
    change_table :sections do |t|
      t.has_attached_file :img_front
      t.has_attached_file :img_back
    end
  end

  def self.down
    drop_attached_file :sections, :img_front
    drop_attached_file :sections, :img_back
  end
end
