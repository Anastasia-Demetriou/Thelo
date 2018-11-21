Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'host', to: 'pages#host_landing_page', as: 'host'
  get 'professional', to: 'pages#professional_landing_page', as: 'professional'

  resources :events do
    resources :bids, only: [:show, :create]
  end

  resources :users, only: :show

  resources :bids, only: [:index, :new, :destroy] do
    member do
      get 'order', to: "bids#order", as: :order
    end
  end

  resources :user_services, only: [:create]

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
