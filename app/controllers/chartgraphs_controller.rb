class ChartgraphsController < ApplicationController
	def index	
		@hourly_measurements = Measurement.where(measurement_periodicity: "horaire")
		@hourly_measurements_stations = @hourly_measurements.pluck(:station_id).uniq.map!{|k| Station.find(k)}
		@hourly_random_station = @hourly_measurements_stations.sample
		@hourly_random_station_random_pollutant = @hourly_measurements.where(station: @hourly_random_station).sample.pollutant
		@daily_measurements = Measurement.where(measurement_periodicity: "journalière")
		@daily_measurements_stations = @daily_measurements.pluck(:station_id).uniq.map!{|k| Station.find(k)}
    @daily_random_station = @daily_measurements_stations.sample
    @daily_random_station_random_pollutant = @daily_measurements.where(station: @daily_random_station).sample.pollutant
		@monthly_measurements = Measurement.where(measurement_periodicity: "mensuelle")
		@monthly_measurements_stations = @monthly_measurements.pluck(:station_id).uniq.map!{|k| Station.find(k)}
		@monthly_random_station = @monthly_measurements_stations.sample
		@monthly_random_station_random_pollutant = @monthly_measurements.where(station: @monthly_random_station).sample.pollutant
		@annual_measurements = Measurement.where(measurement_periodicity: "annuelle")
		@annual_measurements_stations = @annual_measurements.pluck(:station_id).uniq.map!{|k| Station.find(k)}
		@annual_random_station = @annual_measurements_stations.sample
		@annual_random_station_random_pollutant = @annual_measurements.where(station: @annual_random_station).sample.pollutant
	end
end
