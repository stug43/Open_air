class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
			t.belongs_to :township, index: true
			t.string :station_name
			t.string :station_code
			t.string :typology
			t.string :influence
			t.string :latitude
			t.string :longitude

      t.timestamps
    end
  end
end
