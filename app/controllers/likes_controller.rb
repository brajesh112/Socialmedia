class LikesController < ApplicationController
	def create
		@post = Post.find_by(id: params[:post_id])
		@like = @post.likes.where(user_id: current_user.id).present? ?  Like.delete(@post.likes.where(user_id: current_user.id)) : @post.likes.create(user_id: current_user.id)

		respond_to do |format|
	    format.js
	  end 

	end

end