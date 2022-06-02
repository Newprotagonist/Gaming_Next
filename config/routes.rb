Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :favorites, only: %i[index create update destroy]
  resources :wishlists, only: %i[index create destroy]
  resources :games, only: :show

end
