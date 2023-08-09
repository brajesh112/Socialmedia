class SessionsController < ApplicationController
	skip_before_action :require_login, only: [:login, :create, :home]
	def create
		@user = User.find_by(user_name: params[:user_name])
		if !!@user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			# cookies[:created_at] = @user.created_at
			# cookies.encrypted[:date] = Date.tomorrow
			redirect_to user_path(@user)
		else
			flash[:alert] = "Your password is incorrect."
			redirect_to login_path
		end
	end

	def destroy
    session.delete(:user_id)
    @user = nil
    redirect_to root_url, status: :see_other
	end

	def login
		if current_user
			redirect_to user_path(@_current_user)
		end
	end

end