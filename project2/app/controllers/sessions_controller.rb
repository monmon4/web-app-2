class SessionsController < ApplicationController

	skip_before_action :ensure_login, only: [:new, :create]

  def new
  end

  def create
  	account = Account.find_by(user_name: params[:account][:user_name] )
  	password = params[:account][:password]

  	if account && account.authenticate(password)
  		session[:account_id] = account.id
  		redirect_to root_path, notice: "Logged in successfully"
  	else
  		redirect_to login_path, alert: "Invalid user name or password "
	end 
  end

  def destroy
  	reset_session #wipe out session and every thing in it
  	redirect_to login_path, notice: "You have been logged out"
  end
end
