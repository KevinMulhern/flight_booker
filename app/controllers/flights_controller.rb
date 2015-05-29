class FlightsController < ApplicationController

	def index
		@airports = Airport.all.map do |a| 
			[a.code, a.id]
		end
		@dates = Flight.date_list
		@passenger_options = [1,2,3,4]
		@flights = Flight.search(params[:departure_airport_id],
								 params[:destination_airport_id],
								 params[:departure_date])

      	end
end
