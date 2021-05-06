module UsersHelper
  def get_user_image
    # TODO: Check Facebook Developer's settings and see what can be done to fix this
    if @user.user_image.present? && !!@user.user_image.match(/^http:/)
      user_image = @user.user_image.gsub(/^http/, "https")
    else
      user_image = @user.user_image
    end

    @user.user_image ? user_image : 'user_black_logo.jpg'
  end
end
