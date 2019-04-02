Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :skills do
    resources :bookings, only: [:index, :new, :create]
    resources :bookings, only: [:show] do
      resources :reviews, only: [:create, :new]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bookings
  resources :skills
  resources :reviews
end

# /skills/3/bookings/5/reviews
