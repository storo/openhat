if Rails.env.production?
  PAYPAL_ACCOUNT = 'your_account@yourbusiness.com'
else

  PAYPAL_ACCOUNT = 'debian_1343328176_biz@gmail.com'
  ActiveMerchant::Billing::Base.mode = :test
end