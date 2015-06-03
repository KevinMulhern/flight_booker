class FlightsController < ApplicationController

	def index
		@airports = Airport.all.map do |a| 
			[a.code, a.id]
		end
		@dates = Flight.date_list
		@passenger_options = [1,2,3,4]
		@departure_airport = params[:departure_airport_id]
		@destination_airport = params[:destination_airport_id]
		@depart_date = params[:departure_date]
		@passengers = params[:passengers]

		@flights = Flight.search(params[:departure_airport_id],
								 		 params[:destination_airport_id],
								 		 params[:departure_date])
		 	
		if params[:commit] == "Search"
			if params[:departure_airport_id] == params[:destination_airport_id]
				flash[:danger] = "Your Departure and Destination Airports Can Not Be the Same"	
			end
		end

	end
end
