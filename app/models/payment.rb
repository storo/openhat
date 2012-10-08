class Payment < ActiveRecord::Base
  attr_accessible :amount, :order_id, :status, :transaction_number
end
