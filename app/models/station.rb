class Station < ApplicationRecord
	belongs_to :township

	has_many :measurements
	has_many :pollutants, through: :measurements

	validates :station_name, presence: true
	validates :station_code, presence: true
	#######################################
	###  Salon-de-Provence station hasn't typology in datasud csv
	#validates :typology, presence: true
	validates :influence, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true

	def self.get_registred_stations
    output = []
    self.all.each { |µ| output << µ.station_name }
		output.uniq
  end
end
