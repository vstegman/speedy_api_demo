Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show] do
        resources :scores, only:[:index]
      end
      resources :games, only: [:index, :show] do
        resources :scores, only:[:index]
      end
    end
    namespace :v2 do
      resources :users, only: [:index, :show] do
        resources :scores, only:[:index]
        resources :stats, only: [:index]
      end
      resources :games, only: [:index, :show] do
        resources :scores, only:[:index]
        resources :stats, only: [:index]
      end
    end
  end

end
