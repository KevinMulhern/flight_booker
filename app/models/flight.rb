class Flight < ActiveRecord::Base
	belongs_to :departure_airport, class_name: "Airport"
	belongs_to :destination_airport, class_name: "Airport"
	has_many :bookings
	has_many :passengers, through: :passenger_bookings

	validates :departure_airport_id, presence: true
	validates :destination_airport_id, presence: true
	validates :duration, presence: true
	validates :departure_date, presence: true

	def self.date_list
		dates = Flight.all.order(departure_date: :asc)
		dates.map {|n| n.departure_date.strftime("%d/%m/%Y") }.uniq
	end

	def self.search(depart, dest, date)
		Flight.where(departure_airport_id: depart, 
					 destination_airport_id: dest,
					 departure_date: Flight.correct_date(date))
	end


	def self.correct_date(date)
		unless date.nil?
			date = date.to_date
			date.beginning_of_day..date.end_of_day
		end
	end	

end
