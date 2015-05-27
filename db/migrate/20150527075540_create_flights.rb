class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
    	t.string :depature_airport_id
    	t.string :destination_airport_id
    	t.date :depature_date
    	t.time :depature_time
    	t.decimal :duration

      t.timestamps null: false
    end
  end
end
