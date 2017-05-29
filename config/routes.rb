Rails.application.routes.draw do

  # root 'home#index'
  root 'drawings#index'

  get 'login', to: 'access#login'
  post 'access/attempt_login'
  get 'logout', to: 'access#logout'

  resources :users
  resources :abouts
  resources :categories
  resources :images
  resources :drawings

  resources :drawings do
    resources :images
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
