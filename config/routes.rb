

BidPal::Application.routes.draw do

	
    resources :chat_messages do
		member do
			get :users
		end
	end	
  devise_for :users, :controllers => { :registrations => "registrations", :sessions => "sessions", :passwords => "passwords", :confirmations => "confirmations"}
  devise_scope :user do

    #root :to => "devise/sessions#new"
	root :to => "user_sessions#new"			#default page, or first screen of the website
    get "sign_in", :to => "devise/sessions#new"
    get "sign_up", :to => "devise/registrations#new"
	
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#new', :as => :logout
  end
  
  resources :users, :user_sessions, :hand_states
  

  
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
  #root :to => 'user_sessions#new'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  

  #match 'login' => 'devise/sessions#new', :as => :login
  match 'logout' => 'user_sessions#new', :as => :logout
  match 'login' => 'user_sessions#new', :as => :login
  
  
  match 'admin' => 'hand_states#admin', :as => :admin
  match 'dealer' => 'hand_states#new', :as => :dealer
  match 'bidding' => 'chat_messages#index', :as => :bidding
 end
