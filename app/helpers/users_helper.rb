module UsersHelper
  def get_user_image
    @user.user_image ? @user.user_image : 'user_black_logo.jpg'
  end
end
