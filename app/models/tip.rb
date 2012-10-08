class Tip < ActiveRecord::Base
  attr_accessible :receiver, :sender, :tokens
end
