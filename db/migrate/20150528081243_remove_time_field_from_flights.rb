class RemoveTimeFieldFromFlights < ActiveRecord::Migration
  def change
  	remove_column :flights, :depature_date, :date
  	remove_column :flights, :depature_time, :time
  end
end
