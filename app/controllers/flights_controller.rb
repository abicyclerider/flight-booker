class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flight_dates = Flight.pluck(:start_time).map(&:to_date).uniq

    if params[:departure_airport_id].present?
      @flights = Flight.where(departure_airport_id: params[:departure_airport_id],
                              arrival_airport_id: params[:arrival_airport_id])
                      .where("DATE(start_time) = ?", params[:flight_date])
    else
      @flights = []
    end
  end
end
