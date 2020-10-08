Rails.application.routes.draw do
  devise_for :users,controllers:{registrations:'users/registrations',sessions:'users/sessions'}
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'

  resources :card,only: [:new,:create,:destroy]
  resources :items,except: :index do
    resources :payments,only: [:new,:create]

  resources :users, only: [:show] do
    member do
      get :out
    end
  end

  resources :credits, only: [:index]

end
