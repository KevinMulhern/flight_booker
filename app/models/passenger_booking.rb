class PassengerBooking < ActiveRecord::Base
	belongs_to :passengers
	belongs_to :booking
end
