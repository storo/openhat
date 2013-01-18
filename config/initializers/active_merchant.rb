if Rails.env.production?
  PAYPAL_ACCOUNT = 'paypalcl@medialabs.net'
else

  PAYPAL_ACCOUNT = 'paypalcl@medialabs.net'

  #ActiveMerchant::Billing::Base.mode = :test
end