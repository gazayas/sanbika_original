class RegistrationsController < Devise::RegistrationsController
	protected

	def update_resource(resource, params)
		resource.update_without_password(params)
	end

	private

	def sign_up_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

	def sign_in_params
		params.require(:user).permit(:email, :password)
	end

	def account_update_params
    	params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
