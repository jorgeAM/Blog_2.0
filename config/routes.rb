Rails.application.routes.draw do
  resources :comments
  devise_for :users
  resources :articles
  
  root 'welcome#index'
end
