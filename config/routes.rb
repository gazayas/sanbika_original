Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    get 'home/index'
    get 'home/songs' => 'home#songs'
    get 'search' => 'home#search'
    post 'search' => 'home#search'
    root to: 'home#index'

    devise_for :users, controllers: {
      registrations: 'registrations',
      sessions: 'sessions'
    }

    # http://blog.takady.net/blog/2015/11/29/rails-routing-with-username-instead-of-id/
    # resources :users, param: :name, path: '/' do
    resources :users do
      resources :songs do
        member do
          get :print
          post :print
        end
      end
    end
  end
end
