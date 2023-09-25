class SavedPostsController < ApplicationController
	def create
		@post = Post.find_by(id: params[:post_id])
		@posts = params[:value].present? ? Post.joins(:saved_posts).where("saved_posts.user_id"=> current_user.id) : Post.all 
		@save_post = @post.saved_posts.where(user_id: current_user.id).present? ?  SavedPost.delete(@post.saved_posts.where(user_id: current_user.id)) : @post.saved_posts.create(user_id: current_user.id)
	end

	def index
		@posts = Post.joins(:saved_posts).where("saved_posts.user_id"=> current_user.id)
		respond_to do |format|
	    format.js
	  end 
	end
end