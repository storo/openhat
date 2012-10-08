class Section < ActiveRecord::Base
  attr_accessible :free, :gender, :group, :img_back, :img_front, :name, :parent
  has_attached_file :img_back, :styles => {:thumb => { :geometry => '92x92>', :quality => 50}}
  has_attached_file :img_front, :styles => {:thumb => { :geometry => '92x92>', :quality => 50}}
end


