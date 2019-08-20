class Pollutant < ApplicationRecord
	has_many :measurements
	has_many :stations, through: :measurements

	validates :pollutant_name, presence: true
	validates :datasud_pollutant_id, presence: true
	validates :measurement_unit, presence: true

	def self.get_registred_pollutants
    output = []
    self.all.each { |µ| output << µ.pollutant_name }
		output.uniq
  end
end
