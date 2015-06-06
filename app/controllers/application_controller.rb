class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 before_filter :configure_permitted_parameters, if: :devise_controller?
 protected
 def configure_permitted_parameters
 devise_parameter_sanitizer.for(:sign_up) {
	 |u| u.permit(:name, :email, :password, :password_confirmation)
 }
 end
 
  protect_from_forgery with: :exception
  def after_sign_in_path(resouce)
  	members_root_path
  	end
  def after_sign_out_path(resouce)
  	pages_root_path
  	end
  	protected
  	def authenticate_user!
	  	redirect_to new_user_session_path, notice: "ログインしてね。" unless user_signed_in?
  	end
end
