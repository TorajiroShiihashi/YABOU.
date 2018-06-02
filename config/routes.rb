Rails.application.routes.draw do
  resources :microposts
  root 'home#top'
  get '/YABOU.', to: "home#top"
  get '/about', to: "home#about"
  get '/contact', to: 'home#contact'
  get '/signup' , to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
end
