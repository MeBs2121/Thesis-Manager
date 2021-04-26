Rails.application.routes.draw do

  devise_for :users

  root to: 'books#index'

  # get 'public', to: 'public#index'
  resources :books do
    resources :notes
    resources :vocabularies
  end

  get 'welcome', to: 'public#index', as: "public"
end
