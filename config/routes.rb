Rails.application.routes.draw do

  root 'images#index'

  get 'login', :to => 'access#login'
  post 'attempt_login'

  resources :users
  resources :abouts
  resources :categories
  resources :images


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
