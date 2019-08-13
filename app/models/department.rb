class Department < ApplicationRecord
	has_many :townships

	has_many :stations, through: :townships
	has_many :measurements, through: :stations

	validates :dpt_name, presence: true
	validates :dpt_code, presence: true
end
