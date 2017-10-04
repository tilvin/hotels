Rails.application.routes.draw do

  root 'inns#index'

  resources :inns do
    resources :rooms, only: [:show] do
      resources :comments
    end
  end

  resources :bookings, only: [:create, :destroy]
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users

  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout

end
