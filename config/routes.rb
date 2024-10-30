Rails.application.routes.draw do

 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")

  root 'users#new'
    resources :tasks
    resources :users, only: [:new, :create]
   
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
   
    get '/login', to: 'sessions#new'
    post "/login", to: "sessions#create"  
    delete "/logout", to: "sessions#destroy",as:"logout"
   
    get "/me", to: "users#show"
   
   
end
