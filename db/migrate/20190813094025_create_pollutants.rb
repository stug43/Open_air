class CreatePollutants < ActiveRecord::Migration[5.2]
  def change
    create_table :pollutants do |t|
			t.string :pollutant_name
			t.string :datasud_pollutant_id
			t.string :measurement_unit

      t.timestamps
    end
  end
end
