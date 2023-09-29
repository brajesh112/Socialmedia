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
		a = params[:post][:tags].compact_blank!
		for i in 0..a.size
			@tag = Tag.find_or_create_by(user_id: a[i])
			@tag.posts << @post
		end
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