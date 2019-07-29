class Admin::TopicsController < ApplicationController
	def index
		@topics = Topic.all.sort
	end
	def create
	end
	def edit
		@topic = Topic.find(params[:id])
	end
	def update
	end
	def destroy
		@topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to admin_topics_path }
      
      
    end
	end
end
