class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  def check_admin
  	
  	if session[:user] && session[:user] == "admin_passw0rd"
  	else
  		redirect_to controller:"admins"
  	end
  end
end
