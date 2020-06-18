Rails.application.routes.draw do
  resources :apps, only: [:index, :show, :new, :create]
  get 'users/show'
  resources :followings, only: [:create, :destroy]
  devise_for :users
  resources :users, only: [:show]
  root "opinions#new"
  resources :opinions, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
