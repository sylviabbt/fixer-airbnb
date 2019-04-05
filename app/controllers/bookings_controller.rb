class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).where(user: current_user).order(created_at: :desc)
  end

  def new
    @booking = Booking.new
    @skill = Skill.find(params[:skill_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @skill = Skill.find(params[:skill_id])
    @booking.skill = @skill
    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def show
    @user = current_user
    @booking = Booking.find(params[:id])
    @review = Review.new
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :total_price, :address, :contact_info)
  end
end
