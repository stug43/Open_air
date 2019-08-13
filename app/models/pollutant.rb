class Pollutant < ApplicationRecord
	has_many :measurements

	validates :pollutant_name, presence: true
	validates :datasud_pollutant_code, presence: true
	validates :measurement_unit, presence: true
end
