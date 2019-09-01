Rails.application.routes.draw do
  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get    '/guest-admin/login', to: 'static_pages#guest_admin'
  get    '/guest/login', to: 'static_pages#guest_user'
  
  resources :users
end
