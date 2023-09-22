class CommentsController < ApplicationController
	def create
		@comment = Post.find_by(id: params[:comment][:post_id]).comments.create(body: params[:comment][:body], user_id: session[:user_id])
	end
end