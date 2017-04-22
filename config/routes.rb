Rails.application.routes.draw do

  get 'home/index'
  get 'home/songs' => 'home#songs'
  root to: 'home#index'

  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }

  resources :users do
    resources :songs do
      member do
        get :print
      end
    end
  end

  # Todo: URLにユーザ名が表示されるように（これをIssuesに入れること）
  # match '/:name' => 'users#show', via: :get

end
