# Load the rails application


require File.expand_path('../application', __FILE__)
require 'money'
require 'active_merchant'
require 'active_merchant/billing/integrations/action_view_helper'
# Initialize the rails application
Openhat::Application.initialize!
