class BookingsController < ApplicationController
  def new
    flight = Flight.find(params[:flight_id])
    @booking = flight.bookings.build
    params[:num_passengers].to_i.times { @booking.passangers.build }
  end

  def show
    @booking = Booking.find(params[:id])
  end
  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking
    else
      @booking.flight = Flight.find(booking_params[:flight_id]) if booking_params[:flight_id]
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passangers_attributes: [ :name, :email ])
  end
end
