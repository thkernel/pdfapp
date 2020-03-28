Rails.application.routes.draw do
	# Home route.
  root to: "home#index"

  get "posts/show" => "singles#show"
  get "documents" => "pages#documents", as: :documents
  get "posts/show/:slug" => "posts#show", as: :show_post

  # Custom user.
   
  get "/users"     => "custom_users#users_and_permissions", as: :all_users 
  get "/users/unregistered"     => "custom_users#unregistered", as: :unregistered_commission_percentage 
  post "/users/new"     => "custom_users#create", as: :create_user
  get "/users/new"     => "custom_users#new", as: :new_user
  get "/user/edit/:id" => "custom_users#edit", as: :edit_user
  patch "/user/update/:id" => "custom_users#update", as: :udapte_user
  delete "/user/destroy/:id" => "custom_users#destroy", as: :destroy_user
  get "/user/delete/:id" => "custom_users#delete", as: :delete_user
   
  resources :posts do 
    get "delete"
  end

  resources :post_types do 
    get "delete"
  end

  resources :post_categories do 
    get "delete"
  end
  #devise_for :users
  resources :permission_roles do 
    get "delete"
  end
  resources :permissions do 
    get "delete"
  end
  resources :roles


  get "/dashboard" => "dashboard#index" , as: :dashboard
   
   
   
   
     
     devise_for :users, path: '', controllers: { 
       registrations: "users/registrations",
       confirmations: 'users/confirmations',
       passwords: "users/passwords",
       sessions: "users/sessions"
           
       }, 
       path_names: {
           sign_in: 'login', 
           sign_out: 'logout', 
           password: 'secret', 
           confirmation: 'verification', 
           unlock: 'unblock', 
           registration: 'signup', 
           sign_up: '' 
       }
      
     #root 'config_options#new'
     devise_scope :user do
       root to: "users/sessions#new"
       authenticated :user do
         root 'dashboard#index', as: :authenticated_root
       end
   
       unauthenticated do
         root 'users/sessions#new', as: :unauthenticated_root
       end
     end
   
   
     # Dynamic error pages
     get "/404", to: "errors#not_found"
     get "/422", to: "errors#unacceptable"
     get "/500", to: "errors#internal_error"
     mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
end
