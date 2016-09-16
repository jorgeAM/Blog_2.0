Rails.application.routes.draw do
  resources :categories

  #las rutas de commets depende del article
  resources :articles do
  	resources :comments, only: [:create, :destroy, :update]
  end
  
  devise_for :users
  root 'welcome#index'

  get '/dashboard', to: 'welcome#dashboard'
end
