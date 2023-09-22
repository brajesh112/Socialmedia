class ApplicationController < ActionController::Base
	    # before_action :require_login
	    # http_basic_authenticate_with name: "brajesh", password: "1234"
	
	 #   USERS = { "lifo" => "world" }
  # before_action :authenticate
  # TOKEN = "secret"

  # before_action :authenticate

  # private
    # def authenticate
    #   authenticate_or_request_with_http_token do |token, options|
    #     ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
    #   end
    # end

    # def authenticate
    #   authenticate_or_request_with_http_digest do |username|
    #     USERS[username]
    #   end
    # end

  def current_user
   return @_current_user ||= session[:user_id] && User.find(session[:user_id])
  end

  def require_login
	  unless current_user
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_path # halts request cycle
    end
  end
 end
