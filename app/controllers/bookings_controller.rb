class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def new
    @booking = Booking.new
    @profile_sitter = ProfileSitter.find(params[:profile_sitter_id])
  end

  def create
    authorize @booking
    @booking = Booking.new(booking_params)
    # @profile_sitter = ProfileSitter.find(params[:profile_sitter_id])
    # @user = User.find(params:[:user_id])
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
    params.require(:booking).permit(:status, :start_date, :end_date, :profile_sitter_id, :user_id)
  end

end
