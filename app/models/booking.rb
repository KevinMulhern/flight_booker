class Booking < ActiveRecord::Base
	belongs_to :flight
	has_many :passengers, through: :passenger_bookings
	has_many :passenger_bookings
end
