class ReviewsController < ApplicationController

  def new
    # Where's the restaurant???
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review     = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])

    @review = Review.new(review_params)

    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      # we are reloading the same page (accessing the instance variable @review)
      # simple form is getting the @review.error.messages
      # displaying the errors in the form
      render :new
    end

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
