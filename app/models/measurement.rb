class Measurement < ApplicationRecord
	belongs_to :station

  belongs_to :pollutant
end
