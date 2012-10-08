class Token < ActiveRecord::Base
  attr_accessible :name, :price, :quantity, :status
end
