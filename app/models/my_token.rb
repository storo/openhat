class MyToken < ActiveRecord::Base
  attr_accessible :amount, :operation, :payment_id, :user_id
end
