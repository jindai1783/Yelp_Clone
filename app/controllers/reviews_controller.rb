class ReviewsController < ApplicationController
  
  include ReviewsHelper

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end



  def create 
    @restaurant = Restaurant.find(params[:restaurant_id])
    # @review= Review.create(review_params)
    # redirect_to '/restaurants's
    @restaurant.reviews.create(review_params)
    redirect_to restaurants_path
  end
  
end
