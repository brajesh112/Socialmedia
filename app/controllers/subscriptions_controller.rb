class SubscriptionsController < ApplicationController
  def index
  	
  	if params[:query].present?
  		@subscriptions = Subscription.where(id: params[:query])
  	else
  		@subscriptions = Subscription.all
  	end
  end
  def new
  	@subscription = Subscription.new
  end
  def create
  	@subscription = Subscription.new
  	@subscription.status = params[:status]
  	@subscription.magazine_id = params[:magazine_id]
  	@subscription.subscriber_id = params[:subscriber_id]
  	@subscription.save
  	 render :index
  end
end
