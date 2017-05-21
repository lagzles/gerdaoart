Rails.application.routes.draw do

  resources :abouts
  resources :categories
  root 'home#index'

  resources :images
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
