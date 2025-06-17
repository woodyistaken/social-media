Rails.application.routes.draw do
  devise_for :users,controllers: {
    registrations: 'users/registrations'
  }

  resources :posts
  resources :users
  resources :likes
  resources :comments
  resources :follows do 
    collection do 
      post "change"
    end
  end
  root to:"users#index"
  delete "/likes", to:"likes#destroy"
  post "/posts/likes/:id", to:"posts#add_like"
  delete "/posts/likes/:id", to:"posts#delete_like"
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
