class PollutantsController < ApplicationController
  def index
		@pollutants = Pollutant.all
  end

  def show
		@poll = Pollutant.find(params[:id])
		
  end
end
