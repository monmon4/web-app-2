class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :ensure_login
  helper_method :logged_in?, :current_user

  protected
  	def ensure_login
  		#always go to login page unless session contains account_id
  		redirect_to login_path unless session[:account_id]
  	end

  	def logged_in?
  		session[:account_id] #nil is false
  	end

  	def current_user
  		@current_user ||= Account.find(session[:account_id])
  	end
  	

end


