Rails.application.routes.draw do
  resources :followings
  devise_for :users
  root "opinions#index"
  resources :opinions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
