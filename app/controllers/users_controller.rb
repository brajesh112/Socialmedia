require  "prawn"
class UsersController < ApplicationController
	# skip_before_action :require_login, only: [:signup, :create]
	def index
		@users = User.where("id != ?", current_user.id)
	end

	def new
	end

	def edit
	@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.avatar.attach(user_params[:avatar])
		@user.save
	end

	def create
		@user = User.new(user_params)
		  respond_to do |format|
      if @user.save
      	session[:user_id] = @user.id
        # Tell the UserMailer to send a welcome email after save
        UserMailer.with(user: @user).welcome_email.deliver_now

        format.html { redirect_to(root_path, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
		# if @user.save
		# 	# session[:user_id] = @user.id
		# 	# cookies[:created_at] = @user.created_at
		# 	redirect_to root_path
		# else
		# 	render 'new'
		# end
	end

	def show
		@user = User.where(id: params[:id])
		# respond_to do |format|
  #     format.html
  #     format.pdf { render pdf: generate_pdf(@user) }
  #   end

  # response.headers['Content-Type'] = 'text/event-stream'
  #   5.times {
  #     response.stream.write "hello world\n"
  #     sleep 1
  #   }
	 #  ensure
  #   response.stream.close
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
		params.require(:user).permit(:user_name, :password, :password_confirmation, :avatar, :email)
	end
end
