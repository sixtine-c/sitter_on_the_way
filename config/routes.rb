Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :profile_sitters do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index]

  get '/booking/:id/reply', to: 'bookings#reply'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
