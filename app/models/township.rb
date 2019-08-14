class Township < ApplicationRecord
	has_many :stations
	has_many :measurements, through: :stations

	validates :township_name, presence: true
	validates :insee_code, presence: true

	def self.get_registred_townships
    output = []
    self.all { |µ| output << µ.township_name }
		output.uniq!
  end
end
