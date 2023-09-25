module ApplicationHelper
	def user_image
		image_tag User.find_by(id: session[:user_id]).avatar, size:"30"
	end
end