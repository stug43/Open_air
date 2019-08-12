class Admin::TopicsController < ApplicationController
	before_action :is_admin?
	def index
		@topics = Topic.all.sort
	end
	def new
		@topic = Topic.new
	end
	def create
		topic = Topic.new(topic_params)
				topic.main_picture.attach(params[:topic][:main_picture])
				topic.save
			if topic.save
				redirect_to admin_topics_path
				flash[:success]
			else
				render new
				flash[:danger]
			end
	end
	def edit
		@topic = Topic.find(params[:id])
	end
	def update
		@topic = Topic.find(params[:id])
		if params[:topic][:main_picture]
			@topic.main_picture.purge
			@topic.main_picture.attach(params[:topic][:main_picture])
		end
			@topic.title = params[:topic][:title]
			@topic.short_description = params[:topic][:short_description]
			@topic.driver_section_title = params[:topic][:driver_section_title]
			@topic.driver_section_intro = params[:topic][:driver_section_intro]
			@topic.pressure_section_title = params[:topic][:pressure_section_title]
			@topic.pressure_section_intro = params[:topic][:pressure_section_intro]
			@topic.state_section_title = params[:topic][:state_section_title]
			@topic.state_section_intro = params[:topic][:state_section_intro]
			@topic.impact_section_title = params[:topic][:impact_section_title]
			@topic.impact_section_intro = params[:topic][:impact_section_intro]
			@topic.response_section_title = params[:topic][:response_section_title]
			@topic.response_section_intro = params[:topic][:response_section_intro]
			
			if @topic.save
				redirect_to admin_topics_path
        flash[:success]
      else
        render new
        flash[:danger]
      end
	end
	def destroy
		@topic = Topic.find(params[:id])
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to admin_topics_path }
			format.js { render 'destroy.js.erb' }
    end
	end
private
protected
	def topic_params
		params.require(:topic).permit(:title, :short_description, :driver_section_title, :driver_section_intro, :pressure_section_title, :pressure_section_intro, :state_section_title, :state_section_intro, :impact_section_title, :impact_section_intro, :response_section_title, :response_section_intro, :main_picture)
	end
end
