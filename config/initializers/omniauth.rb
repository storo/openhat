Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :twitter, 'gHutCxHbqSupz8h6Lagg', 'bHEemRpEJpDqeHENhJBYVxEINoOGFPUUTsYoSuUp6k'  
  provider :facebook, '394699143898540', '53d8432a7d686b439deecea9c7f36415'  
  #provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'  
end