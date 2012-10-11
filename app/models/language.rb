class Language < ActiveRecord::Base
  attr_accessible :code, :name, :orden
  validates :name, :presence => true
  validates :code, :presence => true
end
