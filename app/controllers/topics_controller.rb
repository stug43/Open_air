# frozen_string_literal: true

class TopicsController < ApplicationController
  def index
    @topics = Topic.with_attached_main_picture.all
  end

  def show
    @atmos = AtmoSud.new
    @atmo_city = AtmoSud.new.city_air_indice
    @topic = Topic.with_attached_main_picture.find(params[:id])
    @related_topics = (Topic.all - [@topic]).sample(3)
    @related_topics_size = @related_topics.size
    @driver_datasets,
    @pressure_datasets,
    @state_datasets,
    @impact_datasets,
    @response_datasets = @topic.get_datasets_by_categories
    if current_user
      @user_dataset_collection = []
      DatasetCollection.where(user: current_user).each do |datasetcollection|
        @user_dataset_collection << datasetcollection.dataset
      end
    end

    @dataweek_article_boolean = (@topic.id == 1) #1 to be changed by whatever is the Topic ID for our Ozone article.

  end
end
