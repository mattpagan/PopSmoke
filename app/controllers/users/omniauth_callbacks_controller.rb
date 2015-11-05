class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def facebook
  	
  	@user = User.from_omniauth(request.env["omniauth.auth"])

    Rails.logger.info "\n\n user #{@user.inspect}"
    Rails.logger.info "\n\n request values: #{request.env["omniauth.auth"]}"
    Rails.logger.info "\n\n request values info : #{request.env["omniauth.auth"].info}"
  	if @user.persisted?
      Rails.logger.info "\n\n persissted"
		 sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
	   set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
  	else
      Rails.logger.info "\n\n else"
    		session["devise.facebook_data"] = request.env["omniauth.auth"]
    		redirect_to new_user_registration_path
  	end
	end
end