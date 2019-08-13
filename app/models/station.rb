class Station < ApplicationRecord
	belongs_to :township
	belongs_to :department, through: :township

	has_many :measurements

	validates :station_name, presence: true
	validates :station_code, presence: true
	validates :typology, presence: true
	validates :influence, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true
end
