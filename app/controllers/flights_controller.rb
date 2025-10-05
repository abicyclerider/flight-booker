class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flight_dates = Flight.pluck(:start_time).map(&:to_date).uniq
    @flights = []
  end
end
