class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_logged_user

  private

  def verify_logged_user
  	if $logged_user == nil && @verified
  		@verified = false
  		redirect_to "/login"
  	else
  		@verified = true;
  	end
  end
end
