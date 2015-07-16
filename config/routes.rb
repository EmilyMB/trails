Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :trails, only: [:index, :show]
      get "/search" => "trails#search"
      resources :birds, only: [:index]
      resources :plants, only: [:index]
    end
  end
end
