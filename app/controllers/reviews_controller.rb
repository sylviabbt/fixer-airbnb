class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    authorize @review
    if @review.save
      redirect_to skill_path(@review.booking.skill)
    else
      render :new
    end
  end

  def show
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
