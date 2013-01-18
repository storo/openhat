class Stage < ActiveRecord::Base
  attr_accessible :category_id, :language_content, :rate, :room_name, :status, :sub_category_id, :type
  has_attached_file :image, :styles => {:thumb => { :geometry => '241x175>', :quality => 50}},:path => ":rails_root/public/images/stages/:style/:id/:filename", :url => "/images/stages/:style/:id/:filename"
  belongs_to :user
end
