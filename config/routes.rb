Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :skills do
    resources :bookings, only: [:new, :create]
    resources :bookings, only: [:show] do
      resources :reviews, only: [:create, :new]
    end
  end
  resources :bookings, only: :index
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# /skills/3/bookings/5/reviews
