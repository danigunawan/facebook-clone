Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :users
  resources :posts
  resources :likes
  resources :comments
end
