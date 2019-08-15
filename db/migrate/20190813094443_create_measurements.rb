class CreateMeasurements < ActiveRecord::Migration[5.2]
  def change
    create_table :measurements do |t|
			t.belongs_to :station, :pollutant, index: true
			t.string :value
			t.string :measurement_periodicity
			t.datetime :measurement_start_date
			t.datetime :measurement_end_date

      t.timestamps
    end
  end
end
