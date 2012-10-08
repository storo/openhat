class Message < ActiveRecord::Base
  #belongs_to :user,  :foreign_key => 'sender'
  #belongs_to :user,  :foreign_key => 'recipient'
  #attr_accessible :body, :recipient, :sender
  belongs_to :yarn
end
