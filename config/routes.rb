Rails.application.routes.draw do
  resources :songs
  devise_for :users
  get 'home/index'

  root to: 'home#index'
end
