class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @user = User.find(params[:user_id])
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @reviewed_user = User.find(params[:user_id])

    @review.reviewed_user = @reviewed_user
    @review.save
    redirect_to user_path(@reviewed_user)
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
