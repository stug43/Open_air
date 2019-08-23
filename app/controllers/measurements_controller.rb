class MeasurementsController < ApplicationController
	def show
		@station = Station.find(params[:station_id])
		@pollutant = Pollutant.find(params[:id])
		@hourly_measurements = Measurement.where(measurement_periodicity: "horaire")
		@daily_measurements = Measurement.where(measurement_periodicity: "journalière")
		@monthly_measurements = Measurement.where(measurement_periodicity: "mensuelle")
		@annual_measurements = Measurement.where(measurement_periodicity: "annuelle")
	end
end
