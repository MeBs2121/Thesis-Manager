Rails.application.routes.draw do

  resources :categories, only: [:new, :create]
  # get 'categories/new'
  # get 'categories/create'
  devise_for :users

  root to: 'books#index'

  # get 'public', to: 'public#index'
  resources :books do
    get '/:category_id', to: 'books#show', as: 'tag'
    resources :notes
    resources :vocabularies
  end

  get 'welcome', to: 'public#index', as: "public"
end
