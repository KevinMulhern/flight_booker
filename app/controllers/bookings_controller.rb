class BookingsController < ApplicationController
  def new
  	@booking = Booking.new
  	@flight = Flight.find_by(id: params[:flight_id])
  	params[:passengers].to_i.times { @booking.passengers.build }
  end

  def show
  end

  def create
  	booking = Booking.create(booking_params)
  	if booking
  		redirect_to booking
  	else
  		render 'new'
  	end

  end

  private

    def booking_params
    	params.require(:booking).permit(:flight_id, passenger_attributes: [:name, :email])
    end
end
