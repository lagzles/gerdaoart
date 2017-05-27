Rails.application.routes.draw do

  root 'images#index'

  get 'login', to: 'access#login'
  post 'access/attempt_login'
  get 'logout', to: 'access#logout'

  resources :users
  resources :abouts
  resources :categories
  resources :images


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
