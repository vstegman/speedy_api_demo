Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :scores, only: [:index]
      resources :users, only: [:index]
      resources :games, only: [:index]
    end
    namespace :v2 do
      resources :scores, only: [:index]
    end
  end

end
