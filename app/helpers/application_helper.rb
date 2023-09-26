module ApplicationHelper
	
	def user_image
		image_tag User.find_by(id: session[:user_id]).avatar, size:"30"
	end

	def likes_name(post)
		@user = User.find_by(id: session[:user_id])
		@users = User.joins(:likes).where("likes.likeable_type"=>"Post", "likes.likeable_id"=>post.id)
		@mutual = Relationship.where(follower_id: @user, followed_id: @users).first
		if @mutual.present?
			# @avatar = User.find_by(id: @mutual.followed_id).avatar
			@follower = User.find_by(id: @mutual.followed_id).user_name 
			@count = post.likes.count - 1 
			s = @count > 0 ? "Liked by #{@follower} and #{@count} others" : "Liked by #{@follower}" 
		else
			s =""
		end
	end

	def save_post(user)
		Post.joins(:saved_posts).where("saved_posts.user_id"=> user)
	end
	def followers_user(user)
		User.joins(:active_relationships).where("relationships.followed_id"=>user.id)
	end
end