Rails.application.routes.draw do
  get "likes/index"
  root "products#index"

  devise_for :users

  resources :products, only: [ :index, :show ]
  resource :cart, only: [ :show ]
  resources :cart_items, only: [ :create, :destroy ] do
    collection do
      delete :clear_cart
    end
  end
  resources :orders, only: [ :index, :create ]
  delete "/clear_orders", to: "orders#clear_orders", as: :clear_orders
  post "/buy_now", to: "orders#buy_now"
  

  resources :products do
    member do
      post "like", to: "likes#create"
      delete "unlike", to: "likes#destroy"
    end
  end
  
  get "liked_items", to: "likes#index"
  






  get "search", to: "products#search"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
