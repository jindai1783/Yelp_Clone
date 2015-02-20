class EndorsementsController < ApplicationController


  # def new
  #   @review = Review.find(params[:review_id])
  #   puts @review
  #   @review.endorsements.create
  #   redirect_to restaurants_path
  # end

  def create
    @review = Review.find(params[:review_id])
    @review.endorsements.create
    render json: {new_endorsement_count: @review.endorsements.count}
    # redirect_to restaurants_path
  end

end
