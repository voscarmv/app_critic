Rails.application.routes.draw do
  resources :apps
  get 'users/show'
  resources :followings
  devise_for :users
  resources :users
  root "opinions#new"
  resources :opinions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
