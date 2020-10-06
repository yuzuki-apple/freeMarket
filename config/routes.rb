Rails.application.routes.draw do
  devise_for :users,controllers:{registrations:'users/registrations',sessions:'users/sessions'}
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'

  resources :card,only: [:new,:create]
  resources :items, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
    member do
      get :buy
    end
  end

end
# /ites/edit(id)