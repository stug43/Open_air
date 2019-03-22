class TopicsController < ApplicationController

	def index
		@topics = Topic.with_attached_main_picture.all
	end

	def show
		@topic = Topic.with_attached_main_picture.find(params[:id])
		@related_topics = []
		6.times do
				(@related_topics << (Topic.all - [@topic]).sample).uniq!
				break if @related_topics.size >= 3
		end
		@driver_datasets, 
		@pressure_datasets, 
		@state_datasets, 
		@impact_datasets, 
		@response_datasets  = @topic.get_datasets_by_categories
		if current_user
			@user_dataset_collection = []
			DatasetCollection.where(user: current_user).each do |datasetcollection|
				@user_dataset_collection << datasetcollection.dataset
			end
		end
	end

end
