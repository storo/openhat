class Language < ActiveRecord::Base
  attr_accessible :code, :name
  validates :name, :presence => true
  validates :code, :presence => true
end
