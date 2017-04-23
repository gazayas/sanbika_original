class RegistrationsController < Devise::RegistrationsController

	# 要らないですかね。tokenをメールで私たら問題はないと思います。
	# またmailerについてはMichael Hartlさんが書いたe-bookを見てみたらいいかもしれません。
	# before_action :authenticate_current_user, only: [:edit]

	protected
	def update_resource(resource, params)
		resource.update_without_password(params)
	end

	# http://jacopretorius.net/2014/03/adding-custom-fields-to-your-devise-user-model-in-rails-4.html

	private

	def sign_up_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def sign_in_params
		params.require(:user).permit(:name, :email, :password)
	end

	def account_update_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
	end

end
