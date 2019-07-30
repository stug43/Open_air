class SearchsController < ApplicationController
    def index
			if params[:mySuperParam]  
      	@test = AtmoSud.new.get_api(params[:mySuperParam].to_s)
    	end
    end

	def show 
	end
	def create
	end
	def search
  end

end

