# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data
puts "Cleaning database..."
Booking.destroy_all
Flight.destroy_all
Airport.destroy_all

# Create airports
puts "Creating airports..."
airports_data = [
  { code: "SFO", name: "San Francisco International Airport" },
  { code: "LAX", name: "Los Angeles International Airport" },
  { code: "JFK", name: "John F. Kennedy International Airport" },
  { code: "ORD", name: "O'Hare International Airport" },
  { code: "ATL", name: "Hartsfield-Jackson Atlanta International Airport" },
  { code: "DFW", name: "Dallas/Fort Worth International Airport" },
  { code: "DEN", name: "Denver International Airport" },
  { code: "SEA", name: "Seattle-Tacoma International Airport" }
]

airports = airports_data.map do |airport_data|
  Airport.create!(airport_data)
end

puts "Created #{airports.count} airports"

# Create flights
puts "Creating flights..."
sfo = Airport.find_by(code: "SFO")
lax = Airport.find_by(code: "LAX")
jfk = Airport.find_by(code: "JFK")
ord = Airport.find_by(code: "ORD")
atl = Airport.find_by(code: "ATL")
dfw = Airport.find_by(code: "DFW")
den = Airport.find_by(code: "DEN")
sea = Airport.find_by(code: "SEA")

flights_data = [
  # SFO departures
  { departure_airport: sfo, arrival_airport: lax, start_time: 1.day.from_now.change(hour: 8), duration: 90 },
  { departure_airport: sfo, arrival_airport: lax, start_time: 1.day.from_now.change(hour: 14), duration: 85 },
  { departure_airport: sfo, arrival_airport: jfk, start_time: 2.days.from_now.change(hour: 9), duration: 330 },
  { departure_airport: sfo, arrival_airport: sea, start_time: 1.day.from_now.change(hour: 11), duration: 120 },
  { departure_airport: sfo, arrival_airport: den, start_time: 3.days.from_now.change(hour: 7), duration: 150 },

  # LAX departures
  { departure_airport: lax, arrival_airport: sfo, start_time: 1.day.from_now.change(hour: 16), duration: 85 },
  { departure_airport: lax, arrival_airport: jfk, start_time: 2.days.from_now.change(hour: 10), duration: 315 },
  { departure_airport: lax, arrival_airport: ord, start_time: 1.day.from_now.change(hour: 12), duration: 240 },
  { departure_airport: lax, arrival_airport: atl, start_time: 2.days.from_now.change(hour: 8), duration: 255 },

  # JFK departures
  { departure_airport: jfk, arrival_airport: sfo, start_time: 3.days.from_now.change(hour: 8), duration: 360 },
  { departure_airport: jfk, arrival_airport: lax, start_time: 2.days.from_now.change(hour: 15), duration: 330 },
  { departure_airport: jfk, arrival_airport: ord, start_time: 1.day.from_now.change(hour: 13), duration: 150 },
  { departure_airport: jfk, arrival_airport: atl, start_time: 2.days.from_now.change(hour: 11), duration: 135 },

  # ORD departures
  { departure_airport: ord, arrival_airport: sfo, start_time: 4.days.from_now.change(hour: 9), duration: 255 },
  { departure_airport: ord, arrival_airport: lax, start_time: 1.day.from_now.change(hour: 14), duration: 270 },
  { departure_airport: ord, arrival_airport: jfk, start_time: 1.day.from_now.change(hour: 10), duration: 145 },
  { departure_airport: ord, arrival_airport: den, start_time: 3.days.from_now.change(hour: 12), duration: 135 },

  # ATL departures
  { departure_airport: atl, arrival_airport: lax, start_time: 2.days.from_now.change(hour: 16), duration: 270 },
  { departure_airport: atl, arrival_airport: jfk, start_time: 3.days.from_now.change(hour: 7), duration: 140 },
  { departure_airport: atl, arrival_airport: dfw, start_time: 1.day.from_now.change(hour: 15), duration: 135 },

  # DFW departures
  { departure_airport: dfw, arrival_airport: sfo, start_time: 4.days.from_now.change(hour: 11), duration: 225 },
  { departure_airport: dfw, arrival_airport: jfk, start_time: 2.days.from_now.change(hour: 13), duration: 210 },
  { departure_airport: dfw, arrival_airport: atl, start_time: 1.day.from_now.change(hour: 9), duration: 130 },

  # DEN departures
  { departure_airport: den, arrival_airport: sfo, start_time: 3.days.from_now.change(hour: 14), duration: 160 },
  { departure_airport: den, arrival_airport: ord, start_time: 2.days.from_now.change(hour: 10), duration: 130 },
  { departure_airport: den, arrival_airport: sea, start_time: 1.day.from_now.change(hour: 8), duration: 135 },

  # SEA departures
  { departure_airport: sea, arrival_airport: sfo, start_time: 2.days.from_now.change(hour: 15), duration: 125 },
  { departure_airport: sea, arrival_airport: lax, start_time: 1.day.from_now.change(hour: 17), duration: 150 },
  { departure_airport: sea, arrival_airport: den, start_time: 3.days.from_now.change(hour: 11), duration: 140 }
]

flights = flights_data.map do |flight_data|
  Flight.create!(flight_data)
end

puts "Created #{flights.count} flights"
puts "Database seeding completed!"
