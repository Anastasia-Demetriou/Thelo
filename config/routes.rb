Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'users#dashboard', as: 'dashboard'
  get 'host', to: 'pages#host_landing_page', as: 'host'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'professional', to: 'pages#professional_landing_page', as: 'professional'

  resources :events do
    resources :bids, only: [:show, :create]
  end

  resources :users, only: [:show, :edit, :update]

  resources :bids, only: [:index, :new, :destroy]

  resources :user_services, only: [:create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
