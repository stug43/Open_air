class Department < ApplicationRecord
	has_many :townships

	has_many :stations, through: :townships
	has_many :measurements, through: :stations

	validates :dpt_name, presence: true
	validates :dpt_code, presence: true

	def self.get_registred_dpts
		output = []
		self.all { |µ| (output << µ.dpt_name).uniq! }
	end

end
