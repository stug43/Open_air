class ChartgraphsController < ApplicationController
	def index	
		@hourly_measurements = Measurement.where(measurement_periodicity: "horaire")
		@daily_measurements = Measurement.where(measurement_periodicity: "journalière")
		@monthly_measurements = Measurement.where(measurement_periodicity: "mensuelle")
		@monthly_measurements_stations = @monthly_measurements.pluck(:station_id).uniq.map!{|k| Station.find(k)}
		@random_station = @monthly_measurements_stations.sample
		@annual_measurements = Measurement.where(measurement_periodicity: "annuelle")
	end
end
