Rails.application.routes.draw do

  resources :categories, only: [:new, :create]
  # get 'categories/new'
  # get 'categories/create'
  devise_for :users

  root to: 'books#index'

  # get 'public', to: 'public#index'
  resources :books do
    # member do
    # get ':category_id', to: 'books#show', as: 'tag'
    # end
    resources :notes
    resources :vocabularies
  end
  
  resources :books do
    
  end

  get 'welcome', to: 'public#index', as: "public"
end
