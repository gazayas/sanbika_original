Rails.application.routes.draw do

  get 'home/index'
  root to: 'home#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'users/index' => 'users#index'
  get 'users/:id(.:format)' => 'users#show'

  # URLにユーザ名が表示されるように
  match '/:name' => 'users#show', via: :get

  resources :songs







end
