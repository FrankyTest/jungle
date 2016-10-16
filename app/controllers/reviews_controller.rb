class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)

    # @review.save

    if @review.save
      redirect_to '/'
    else
      redirect_to product_path(@review.product)
    end
  end

  def destroy
    @review = Review.find(params['id'])

    @review.destroy
    redirect_to product_path(@review.product)
  end

  private

  def review_params
    params.require(:review).permit(:product_id, :user_id, :description, :rating)
  end
end
