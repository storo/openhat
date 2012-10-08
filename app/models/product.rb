class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :user_id
  belongs_to :user
end