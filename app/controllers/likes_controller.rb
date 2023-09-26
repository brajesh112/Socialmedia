class LikesController < ApplicationController
	def create
		if params[:comment_id].present?
			@comment = Comment.find_by(id: params[:comment_id])
			@like = @comment.likes.where(user_id: current_user.id).present? ?  Like.delete(@comment.likes.where(user_id: current_user.id)) : @comment.likes.create(user_id: current_user.id)
		else
			@post = Post.find_by(id: params[:post_id])
			@like = @post.likes.where(user_id: current_user.id).present? ?  Like.delete(@post.likes.where(user_id: current_user.id)) : @post.likes.create(user_id: current_user.id)
			@posts = Post.all
		end
		respond_to do |format|
	    format.js
	  end 

	end

end