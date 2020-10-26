module ApplicationHelper

  # The follwing three methods have been added to
  # enable the Devise partial on the home#index page
  def devise_mapping
    Devise.mappings[:user]
  end

  def resource_name
    devise_mapping.name
  end

  def resource_class
    devise_mapping.to
  end

  def get_favorite user_id, song_id
      Favorite.where(user_id: user_id, song_id: song_id).first
  end
end
