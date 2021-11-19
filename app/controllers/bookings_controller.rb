class BookingsController < ApplicationController

  def index
    if params["type"] == "sitter"
      @booking_scope = policy_scope(Booking)
      @bookings = BookingPolicy::Scope.new(current_user, Booking).my_sitter_bookings
    else
      @bookings = policy_scope(Booking).includes(:user).order(created_at: :desc)
    end
  end

  def new
    @booking = Booking.new
    authorize @booking
    @booking.user_id = current_user.id
    @profile_sitter = ProfileSitter.find(params[:profile_sitter_id])
    @profile_start = @profile_sitter.start_date
    @profile_end = @profile_sitter.end_date
    @dates_not_available = Booking.where(profile_sitter: @profile_sitter)
    unless @dates_not_available.nil?
      @disable_date = []
      @dates_not_available.each do |booking|
        dates = {from: booking.start_date.strftime("%Y-%m-%d"), to: booking.end_date.strftime("%Y-%m-%d")}
        @disable_date << dates
      end
    end

  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @profile_sitter = ProfileSitter.find(params[:profile_sitter_id])
    @booking.profile_sitter = @profile_sitter
    @booking.status = 'Pending answer'
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  def accepts
    skip_authorization
    @booking = Booking.find(params[:id])
    @booking.update(status: 'Accepted')
    redirect_to bookings_path(type: 'sitter')
  end

  def decline
    skip_authorization
    @booking = Booking.find(params[:id])
    @booking.update(status: 'Declined')
    redirect_to bookings_path(type: 'sitter')
  end

  def cancel
    skip_authorization
    @booking = Booking.find(params[:id])
    @booking.destroy
    if params['type'] == 'sitter'
      redirect_to bookings_path(type: 'sitter')
    else
      redirect_to bookings_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
