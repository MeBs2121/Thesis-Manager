Rails.application.routes.draw do

  devise_for :users

  root to: 'books#index'

<<<<<<< HEAD
  get 'public', to: 'public#index'
  resources :books do
    resources :notes
  end
=======
  get 'welcome', to: 'public#index', as: "public"
  resources :books
>>>>>>> 0dca5c2a137168240c22154d4568d266c68d3ce9

end
