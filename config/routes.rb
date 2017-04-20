Rails.application.routes.draw do

  resources :circles do
  	resources :orders, controller: 'circles/orders' do
      collection { get :empty }
    end
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  get 'login/index'
  root "login#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
