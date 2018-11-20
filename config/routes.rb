Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'host', to: 'pages#host_landing_page', as: 'host'
  get 'professional', to: 'pages#professional_landing_page', as: 'professional'


  resources :events do
    resources :bids, only: :show
  end

  resources :events do
    resources :services, only: [:index, :show]
  end

  resources :users, only: :show do
    resources :bids, only: [:index, :show, :create, :new, :destroy]
  end

  resources :users do
    resources :user_services, only: [:index, :new, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
