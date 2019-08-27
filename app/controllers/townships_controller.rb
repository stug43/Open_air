class TownshipsController < ApplicationController
  def index
		@townships = Township.all
  end

  def show
		puts params
		@township = Township.find(params[:id])
		@stations = @township.stations
  end
end
