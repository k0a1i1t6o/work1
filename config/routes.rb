Rails.application.routes.draw do

  root 'static_pages#top'
  get '/home', to: 'static_pages#home'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/set', to: 'goalposts#new'
  post '/set', to: 'goalposts#create'
  get 'rakuten_search' => 'goalposts#form'
  resources :users
  resources :goalposts do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
