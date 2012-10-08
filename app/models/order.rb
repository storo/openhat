class Order < ActiveRecord::Base
  attr_accessible :token_id, :user_id
end
