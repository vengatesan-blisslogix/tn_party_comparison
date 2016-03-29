class AdminsController < ApplicationController
	def index

	end
	def login

  if params[:user_name] && params[:user_name]=="admin" && params[:password] && params[:password]=="passw0rd"
  	session[:incorrect_login]="Welcome Admin"
  	session[:user] = params[:user_name]+"_"+params[:password]
  redirect_to controller:"party_lists",action: "index"
  
  else
  	session[:incorrect_login]="Incorrect User Name & Password"
  	redirect_to controller:"admins"
  end
	end

	def logout
  	session[:user]=""
  	session[:incorrect_login]="Logged out successfully!!!"
  	redirect_to controller:"admins"
  end

end
