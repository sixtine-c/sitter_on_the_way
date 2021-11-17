class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def new
    @booking = Booking.new
    authorize @booking
    @booking.user_id = current_user.id
    @profile_sitter = ProfileSitter.find(params[:profile_sitter_id])
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @profile_sitter = ProfileSitter.find(params[:profile_sitter_id])
    @booking.profile_sitter = @profile_sitter
    @booking.status = 'No answer'
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
