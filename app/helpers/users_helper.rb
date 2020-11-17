module UsersHelper
  def get_image
    @user.user_image ? @user.user_image : 'user_black_logo.jpg'
  end
end
