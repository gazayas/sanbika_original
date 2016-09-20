Rails.application.routes.draw do

  get 'home/index'
  root to: 'home#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users do
    resources :songs
  end

  # URLにユーザ名が表示されるように
  # match '/:name' => 'users#show', via: :get









end
