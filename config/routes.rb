Rails.application.routes.draw do

  devise_for :users

  root to: 'books#index'

  get 'welcome', to: 'public#index', as: "public"
  resources :books

end
