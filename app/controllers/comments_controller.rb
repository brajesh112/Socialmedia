class CommentsController < ApplicationController
	
	def create
		if params[:comment][:comment_id].present?
			@comments = Comment.find_by(id: params[:comment][:comment_id]) 
			@comment = @comments.replies.create(body: params[:comment][:body], post_id: @comments.post_id, user_id: session[:user_id])
		else
			@comment = Post.find_by(id: params[:comment][:post_id]).comments.create(body: params[:comment][:body], user_id: session[:user_id])
		end
	end

end