class PassengerMailer < ApplicationMailer

	def thank_you(passenger)
    @passenger = passenger
    @from_location = @passenger.bookings.last.flight.departure_airport.location
    @to_location = @passenger.bookings.last.flight.destination_airport.location

    mail(to: @passenger.email, subject: "Thank You For Your Booking")
	end
end
