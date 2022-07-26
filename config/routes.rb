Rails.application.routes.draw do
  get 'users/new'
  root 'pages#home'
  get 'about', to: 'pages#about'

  get 'signup', to: 'users#new'
  # post 'users', to: 'users#create'

  resources :articles
  resources :users, except: [:new]
end
