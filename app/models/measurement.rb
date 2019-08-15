class Measurement < ApplicationRecord
	belongs_to :station
  belongs_to :pollutant

	validates :datasud_measurement_fid_code, presence: true
	validates :value, presence: true
	validates :measurement_periodicity, presence: true
	validates :measurement_start_date, presence: true 
	validates :measurement_end_date, presence: true 

	def self.get_registred_measurements
    output = []
    self.all.each { |µ| output << µ.datasud_measurement_fid_code }
    output.uniq
  end
end
