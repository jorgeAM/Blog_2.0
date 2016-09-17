Rails.application.routes.draw do
  resources :categories

  #las rutas de commets depende del article
  resources :articles do
  	resources :comments, only: [:create, :destroy, :update]
  end
  
  devise_for :users
  root 'welcome#index'
  #ruta para el dashboard
  get '/dashboard', to: 'welcome#dashboard'
  #put se usa para modificar ruta existente
  put '/articles/:id/publish',as: :publish_article, to: 'articles#publish'
  #get '/articles/:id/publish', as: :publish_article, to: 'articles#publish'
end
