class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
  prepend_view_path "app/views/users"
  
  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
     attachments['Tiger.jpeg'] = File.read('/home/user/Downloads/aa.jpeg')
     # mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    	# template_path: 'users',
     #     template_name: 'welcome_email')
      # @user = params[:user]
  mail(
    to: email_address_with_name(@user.email, "gfdfg"),
    subject: 'Welcome to My Awesome Site'
  )
  end
end
