Rails.application.routes.draw do
  get 'login/index'
  root "login#index"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

  resources :users do
    member { get :onboarding }
  end

  resources :circles do
  	resources :orders, controller: 'circles/orders' do
      collection { get :empty }
      member { get :accept }
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
