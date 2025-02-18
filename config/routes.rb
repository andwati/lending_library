Rails.application.routes.draw do
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :books, only: [ :index, :show, :create, :update, :destroy ]
  # resources :users, only: [ :index, :show, :create ]
  root "home#index"
  resources :books
  resources :users, only: [ :show, :new, :create ]  # Route to view user activity
  resources :borrows, only: [ :new, :create ]
  resources :returns, only: [ :new, :create ]


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  #
  post "/borrow", to: "borrows#create"
  get "/borrow/user/:user_id", to: "borrows#user_borrows"
  get "/borrow/book/:book_id", to: "borrows#book_borrows"

  post "/return", to: "returns#create"
  get "/return/user/:user_id", to: "returns#user_returns"
  get "/return/book/:book_id", to: "returns#book_returns"
end
