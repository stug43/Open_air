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

	def pollutant_prefix
		(self.pollutant_name.delete(" ").downcase[0].scan(/[aeiou]/).size > 0 ? "d'" : "de ")
	end		

end
