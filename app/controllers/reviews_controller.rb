class ReviewsController < ApplicationController
  
  include ReviewsHelper

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end



  def create 
    @restaurant = Restaurant.find(params[:restaurant_id])

    object = review_params
    object["user_id"]=current_user.id.to_s
    @restaurant.reviews.create(object)

    redirect_to restaurants_path
  end
  
end
