# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
dates = []
airports = {"LON" => "London",
      		"LIV" => "Liverpool"}
      		#"GlA" => "Glasgow",
      		#"MAN" => "Manchester"}
      
# create the aiports
airports.each do |code, airport|
  Airport.create(code: code, location: airport)
end

# 10 random dates for the dates loop
5.times do 
	dates << (Faker::Date.forward(25))
end


def random_date_time(date)
	date = Faker::Time.between(date.beginning_of_day, date.end_of_day, :day)
	puts "the departure_date = #{date}"
	return date
end




# make 5 flights for each airport on each day

# loop over all the departing airports
airports.each_with_index do |depart_airport, depart_index| 
	depart_airport_id = depart_index + 1
	puts
	puts "FIRST LOOP - departing airports"
	puts "on departure airport #{depart_airport_id}"
	puts

	# loop over all the destination airports
	airports.each_with_index do |destination_airport, dest_index|
		puts
		puts "SECOND LOOP - destination airports"
		puts "In to the next loop destination airports"

		dest_airport_id = dest_index + 1

		puts "The current destination airport is: #{dest_airport_id}"
		puts

		next if dest_index == depart_index
	
		# loop over all the dates
		dates.each do |date|
			puts
			puts "THIRD LOOP - dates"
			puts "In the next loop - dates"
			puts "The current date is #{date}"
			# create 5 flights
			5.times do
				puts
				puts "FOURTH LOOP - creat flights"
				puts "Departure_id = #{depart_airport_id}"
				puts "Destination_id = #{dest_airport_id}"

				Flight.create(departure_airport_id: depart_airport_id,
					  destination_airport_id: dest_airport_id ,
					  duration: rand(1..3),
					  departure_date: random_date_time(date))
			end
		end
	end
end












