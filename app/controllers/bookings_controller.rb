class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def new
  end

  def create
    authorize @booking
  end

  def update
  end

  def destroy
  end

end
