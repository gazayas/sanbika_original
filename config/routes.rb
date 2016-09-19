Rails.application.routes.draw do
  resources :songs

  devise_for :users, :controllers => { registrations: 'registrations' }
  

  get 'home/index'

  root to: 'home#index'


  
end
