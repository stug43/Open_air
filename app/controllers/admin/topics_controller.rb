class Admin::TopicsController < ApplicationController
before_action :is_admin?

	def index
		@topics = Topic.all
	end 
	
	def new
	end

	def create
		@topic.save(topic_params)
		redirect_to admin_topics_path
	end

	def edit
	end

	def update
	end

	def show
	end

	def destroy
		@topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to admin_topics_path }

    end
	end

end
