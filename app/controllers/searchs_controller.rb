class SearchsController < ApplicationController
    def index
    end

	def show 
		#@atmos = AtmoSud.new.city(params[:id])
		#@chart = (@atmos.to_i / 10)*10 + 5
		@test = AtmoSud.new.get_api(params[:id])


	end
	def create
		#@atmos = AtmoSud.new.city(params[:search])
		
		@test = AtmoSud.new.get_api(params[:search])
		redirect_to search_path(params[:search])
	end

	  def search
    lookup = params[:lookup]

  end

end

