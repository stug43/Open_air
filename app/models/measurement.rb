class Measurement < ApplicationRecord
	belongs_to :station
  belongs_to :pollutant

	validates :value, presence: true
	validates :measurement_periodicity, presence: true
	validates :measurement_start_date, presence: true 
	validates :measurement_end_date, presence: true 

	def self.get_registred_measurements
    output = []
    self.all.each { |µ| output << [µ.station.station_name, µ.pollutant.pollutant_name, µ.measurement_start_date] }
    output.uniq
  end
end
