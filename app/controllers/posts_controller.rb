class PostsController < ApplicationController
	protect_from_forgery
	def index
		@posts = Post.all
		@post = Post.new()
		@comment = Comment.new()
		@comments = @post.comments.last if @post.comments.present?
	end

	def create
		@post =  current_user.posts.new(post_params)
		@post.save
		respond_to do |format|
	    format.js
	  end
	end

	def show
		@post = Post.find_by(id: params[:id])
	end

		def post_params
			params.require(:post).permit(:description, :image)
		end
end