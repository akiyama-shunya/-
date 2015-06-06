class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def facebook
	callback_from :facebook
	end
	
	private
	def callback_from(provider)
	provider = provider.to_s
	@user = User.find_for_oauth(request.env['omniauth.auth'])
	
	if @user.persisted?
set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
#	cookies.permanent[:xxx_logined] = {value: @user.created_at}
#	flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
	sign_in @user, event: :authentication
	#sign_in authentication.user
	redirect_to members_root_path
	else
	session["devise.#{provider}_data"] = request.env['omniauth.auth']
	redirect_to new_user_registration_url
	end
	end
end