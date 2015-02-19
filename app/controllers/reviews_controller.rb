class ReviewsController < ApplicationController
  
  include ReviewsHelper

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end



  def create 
    @restaurant = Restaurant.find(params[:restaurant_id])

    if current_user.has_reviewed? @restaurant
      # do some error message
      flash[:notice] = 'You already reviewed this one'
    else
      @review = @restaurant.reviews.build(review_params)
      @review.user = current_user
      @review.save
    end

    redirect_to restaurants_path
  end
  
  
  private

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end
end
