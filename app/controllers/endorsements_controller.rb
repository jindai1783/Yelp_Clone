class EndorsementsController < ApplicationController


  # def new
  #   @review = Review.find(params[:review_id])
  #   puts @review
  #   @review.endorsements.create
  #   redirect_to restaurants_path
  # end

  def create
    @review = Review.find(params[:review_id])
    puts @review
    @review.endorsements.create
    redirect_to restaurants_path
  end

end
