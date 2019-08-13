class CreateMeasurments < ActiveRecord::Migration[5.2]
  def change
    create_table :measurements do |t|
			t.belongs_to :station, :pollutant, index: true
			t.string :value
			t.string :measurement_periodicity
			t.string :measurement_start_date
			t.string :measurement_end_date

      t.timestamps
    end
  end
end
