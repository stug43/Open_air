class Township < ApplicationRecord
	has_many :stations
	has_many :measurements, through: :stations

	validates :township_name, presence: true
	validates :insee_code, presence: true
end
