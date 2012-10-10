Openhat::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :authentications
  match '/auth/:provider/callback' => 'authentications#create'
  devise_for :users ,  :controllers => { :registrations => 'registrations' } do
    get "/register"   => "registrations#new",   :as => :new_user_registration
    get "/login", :to => "devise/sessions#new"
  end

  match 'profile' => 'home#profile', :as => 'profile'
  match 'profile/:id' => 'home#public_profile', :as => 'public_profile'
  match 'accounts_settings' => 'home#accounts_settings', :as => 'accounts_settings'
  match 'follow/:id' => 'home#follow', :as => 'follow'
  match 'unfollow/:id' => 'home#unfollow', :as => 'unfollow'
  match 'messages' => 'messages#index', :as => 'messages'
  match 'messages/new.:format' => 'messages#user_ajax'
  match 'message/send' => 'messages#sendto', :via => "post"
  match 'stage/create' => 'stages#create', :via => "post"
  match 'message_new' => 'messages#new', :as => 'message_new'
  match 'message/:id' => 'messages#read', :as => 'message_read'
  match 'avatar/maker' => 'avatars#index', :as => 'avatar_maker'
  match 'avatar/getSections/:id' => 'avatars#getSections'
  match 'avatar/getSectionUrl/:id' => 'avatars#getSectionUrl'
  match 'create_performance' => 'stages#makeStage', :as => 'create_performance'
  match 'stage' => 'stages#index'
  match 'stage/:id' => 'stages#index', :as => 'stage'
  match 'category/:id' => 'categories#index', :as => 'category'
  match '/pages/:page' => "pages#page", :as => 'pages'
  match 'buy_tokens' => "tokens#buy", :as => 'buy_tokens'
  match 'buy_show' => "tokens#show"
  match 'buy_cancel' => "tokens#cancel"
  match 'send_tips/:id/:stage'  => "tokens#send_tips", :as => 'send_tips'
  match 'send_heckle'  => "tokens#send_heckle", :as => 'send_heckle'
  match 'sendtip' => "tokens#sendtip"
  match 'changeimage' => "home#changeimage"
  match 'report' => "stages#report"
  match 'share/:id' => "home#share"
  match 'close/:id' => "stages#close"
  match 'configuration/:id' => "stages#configuration"
  match 'saveconfiguration/:id/:option' => "stages#saveconfiguration"
  match 'tippers/:id' => 'stages#tippers'
  match 'totaltips/:id' => 'stages#totaltips'
  match 'savecharacter' => "home#savecharacter", :as => 'savecharacter', :via => 'post'
  match 'saveinformation' => "home#saveinformation", :as => 'saveinformation', :via => 'post'
  match 'buy/:heckle/:tokens/:amount' => "tokens#buytokens"
  match 'discountHeckle/:heckle' => 'tokens#discountHeckle'

  root :to => 'home#index'




  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
