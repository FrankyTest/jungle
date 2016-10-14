class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)

    @review.save

    if @review.save
      redirect_to '/'
    else
      byebug
      redirect_to product_path(params.product_id)
    end
  end

  def destroy
    Review.find(params.id).destroy
    byebug
    redirect_to product_path(params.product_id)
  end

  private

  def review_params
    params.require(:review).permit(:product_id, :user_id, :description, :rating)
  end
end
