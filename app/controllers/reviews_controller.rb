class ReviewsController < ApplicationController
  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.save
    redirect_to user_path(current_user)
    authorize @review
  end

  private


  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
