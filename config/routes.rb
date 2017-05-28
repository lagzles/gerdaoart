Rails.application.routes.draw do

  resources :carousels
  root 'home#index'

  get 'login', to: 'access#login'
  post 'access/attempt_login'
  get 'logout', to: 'access#logout'

  resources :users
  resources :abouts
  resources :categories
  resources :images

  resources :carousels do
    resources :images
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
