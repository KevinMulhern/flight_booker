class RemovePassengerBookingIdFromBookingTable < ActiveRecord::Migration
  def change
  	remove_column :bookings, :passenger_booking_id, :integer
  end
end
