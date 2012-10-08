class Category < ActiveRecord::Base
  attr_accessible :name, :state
  has_many :sub_categories, :dependent => :destroy
  validates :name, :presence => true
end
