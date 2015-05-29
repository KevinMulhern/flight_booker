class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
    	t.integer :depature_airport_id
    	t.integer :destination_airport_id
    	t.date :depature_date
    	t.time :depature_time
    	t.integer :duration

      t.timestamps null: false
    end
  end
end
