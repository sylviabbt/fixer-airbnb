Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :skills do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:show] do
    resources :reviews, only: [:create, :new, :show]
  end
  resources :bookings, only: :index
  resources :users, only: [:show, :edit] do
    resources :skills, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
