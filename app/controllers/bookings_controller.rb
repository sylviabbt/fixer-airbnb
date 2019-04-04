class BookingsController < ApplicationController
  def index

    @bookings = policy_scope(Booking).all.where(user: current_user)

  end

  def new
    @booking = Booking.new
    authorize @booking

  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @skill = Skill.find(params[:skill_id])
    @booking.skill = @skill
    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :total_price, :address, :contact_info)
  end
end
