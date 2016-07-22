Rails.application.routes.draw do
  
  resources :attachments, only: [:index, :create, :destroy]
  resources :schedules
  
  namespace :specialists do
    root :to => 'welcome#index'
    resources :profiles, only: [:index, :edit, :update]
    resources :posts
    resources :schedules
  end
  devise_for :specialists, path: :specialists, path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: "specialists/sessions", passwords: "specialists/passwords", registrations: "specialists/registrations", unlocks: "specialists/unlocks" }
    
  namespace :admins do
    root :to => 'welcome#index'
    resources :users do
      member do
        get :inheritor
        get :supervisor
      end
    end
    resources :specialists
    resources :posts
    resources :study_courses do
      resources :tutorials
    end
    resources :tutorials
    resources :schedules    
  end
  
  
#  devise_scope :admin_user do    
#    get '/admins/auth/:provider/callback', to: 'admins/omniauth_callbacks#sync'
#  end
  
  
  devise_for :admin_users, path: :admins, path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: "admins/sessions", passwords: "admins/passwords", registrations: "admins/registrations", unlocks: "admins/unlocks" }
  scope :module => :users do
    root :to => 'welcome#index'
    resources :profiles, only: [:index, :edit, :update]
    resources :posts
    resources :consults do      
      collection do
        get :search
        get ':id/:specialized_field_id', :action => :show, :as => 'detail'
        get ':id/appointment/:specialized_field_id/:schedule_entity_id', :action => :appointment, :as => 'appointment'
        post ':id/appointment/:specialized_field_id/:schedule_entity_id', :action => :appointment_create, :as => 'appointment_create'
      end
    end
    
    namespace :study do
      root :to => 'courses#index'
      resources :courses, only: [:index, :show] do
        collection do
          get :search
          get ':id/tutorial/:tutorial_id', :action => :tutorial, :as => 'tutorial'
        end
      end
    end
  end
  
  devise_scope :user do    
    get '/users/auth/:provider/callback', to: 'users/omniauth_callbacks#sync'
  end
  #devise_for :users, path: :users #, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :users, path: :users, path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: "users/sessions", passwords: "users/passwords", registrations: "users/registrations", unlocks: "users/unlocks" }
    
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  
  #get "auth/:provider/callback/", :to => "omniauth_callbacks#sync"
#  get 'auth/:provider/callback', to: 'sessions#create'
#  get '/users/auth/:provider/callback', to: 'omniauth_callbacks#sync'
end
