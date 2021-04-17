Rails.application.routes.draw do

  devise_for :users

  root to: 'books#index'

  get 'public', to: 'public#index'
  resources :books

end
