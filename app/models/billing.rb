class Billing < ActiveRecord::Base
  attr_accessible :account, :address, :city, :country, :state, :user_id, :zip
end
