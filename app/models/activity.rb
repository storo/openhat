class Activity < ActiveRecord::Base
  attr_accessible :artist, :description, :event_id, :type, :user_id
  # type  ---- call, tokens, buy, watch
  
end
