Rails.application.routes.draw do
  get 'sessions/new'
  resources :microposts
  root 'home#top'
  get    '/YABOU.',  to: "home#top"
  get    '/about',   to: "home#about"
  get    '/contact', to: 'home#contact'
  get    '/signup' , to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
end
