Rails.application.routes.draw do
  resources :microposts
  resources :users
  root 'home#top'
  get '/YABOU.', to: "home#top"
  get '/about', to: "home#about"
  get '/contact', to: 'home#contact'
  get '/signup' , to: 'users#new'
end
