class Follower < ActiveRecord::Base
  belongs_to :user 
  attr_accessible :leader, :user_id
end
