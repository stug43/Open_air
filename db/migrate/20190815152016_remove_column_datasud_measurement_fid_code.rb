class RemoveColumnDatasudMeasurementFidCode < ActiveRecord::Migration[5.2]
  def change	
		remove_column :measurements, :datasud_measurement_fid_code, :string
  end
end
