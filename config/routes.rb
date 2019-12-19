Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :users
  resources :posts
  resources :likes
  resources :comments
  resources :friendships
  post 'confirm_friend', to: 'users#confirm_friend', as: "confirm_friend"
  post 'decline_friend', to: 'users#decline_friend'
  get '/friends', to:'users#friends'
  get '/friendships', to: 'friendships#index'
end
