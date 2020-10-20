Rails.application.routes.draw do

  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks"}

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    # TODO: Change routes to something simple like "home" instead of "home#index"
    # Change links (paths) accordingly: i.e. - home_songs_path => songs_path

    get 'home/index'
    get 'home/songs' => 'home#songs'
    root to: 'home#index'

    # http://blog.takady.net/blog/2015/11/29/rails-routing-with-username-instead-of-id/
    # resources :users, param: :name, path: '/' do
    resources :users do
      resources :songs do
        member do
          get :print
          post :print
        end
      end

      # Songs should be like on their respective page,
      # but it ultimately belongs to the user and
      # they can remove
      resources :favorites, only: [:create, :destroy]
    end

  end
end
