require  "prawn"
class UsersController < ApplicationController
	skip_before_action :require_login, only: [:signup, :create]
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			# session[:user_id] = @user.id
			# cookies[:created_at] = @user.created_at
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
		respond_to do |format|
      format.html
      byebug
      format.pdf { render pdf: generate_pdf(@user) }
    end
	end

 # def download_pdf
 #    user = User.find(session[:user_id])
 #    # send_data generate_pdf(user),
 #    #           filename: "#{user.user_name}.pdf",
 #    #           type: "application/pdf",
 #              # disposition: "inline"
 #    send_file("/home/user/Downloads/#{user.user_name}.pdf",
 #              filename: "#{user.id}.pdf",
 #              type: "application/pdf")
 #  end

  private
    def generate_pdf(user)
      Prawn::Document.new do
        text user.user_name, align: :center
        text "Address: #{user.id}"
        text "Email: #{user.password}"
      end.render
    end

	def user_params
		params.require(:user).permit(:user_name, :password, :password_confirmation)
	end
end
