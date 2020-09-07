Rails.application.routes.draw do
  devise_for :users,controllers:{registrations:'users/registrations',sessions:'users/sessions'}
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'
  resources :items, only: [:index, :show]

  resources :items, only: :new
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items, only: :show

end
