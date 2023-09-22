class RelationshipsController < ApplicationController
	def create
		@user = User.find_by(id: params[:user_id]) 
		@follow = Relationship.where(follower_id: current_user.id, followed_id: params[:user_id]).present? ?  Relationship.delete(current_user.active_relationships.where(followed_id: params[:user_id])) : current_user.active_relationships.new(followed_id: params[:user_id]).save
	end
end