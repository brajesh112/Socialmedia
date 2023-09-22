class SessionsController < ApplicationController
	# skip_before_action :require_login, only: [:login, :create, :home]
	def create
		@user = User.find_by(user_name: params[:user][:user_name])
		if !!@user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
		end
		return redirect_to root_path
	end

	def destroy
    session.delete(:user_id)
    @user = nil
    redirect_to root_url, status: :see_other
	end

end