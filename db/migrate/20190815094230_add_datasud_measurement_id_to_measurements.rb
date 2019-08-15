class AddDatasudMeasurementIdToMeasurements < ActiveRecord::Migration[5.2]
  def change
		add_column :measurements, :datasud_measurement_fid_code, :string
  end
end
