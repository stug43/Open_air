class StationsController < ApplicationController
  def index
		@stations = Station.all
  end

  def show
		@station = Station.find(params[:id])
		@pollutants = @station.pollutants.uniq
  end
end
