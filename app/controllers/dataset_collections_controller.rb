# frozen_string_literal: true

class DatasetCollectionsController < ApplicationController
  before_action :access_my_collection_only

  def show
		@results = get_api(params[:results])
    @datasets = []
    DatasetCollection.where(user: current_user).each do |dataset|
      @datasets << dataset.dataset
    end
  end

  def create
    @topic = Topic.find(params[:id])
    @user = User.find(params[:user_id])
    @dataset = Dataset.find(params[:dataset])
    @dataset_collection = DatasetCollection.create(user: @user, dataset: @dataset)
    respond_to do |format|
      format.js
      format.html do
        redirect_to topic_path(@topic), notice: 'votre donnée a été correctement enregistrée et se trouve désormais dans votre librairie'
      end

      format.json
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @dataset = Dataset.find(params[:dataset])
    @dataset_collection = DatasetCollection.where(user: @user).where(dataset: @dataset).first
    @dataset_collection.destroy

    respond_to do |format|
      format.js
      format.html do
        redirect_to user_dataset_collection_path(current_user), notice: 'data correctement supprimé'
      end
      format.json
    end
  end

  private

def get_api(a)
  i = 0
  t = []
  search = a.to_s
  url = "https://trouver.datasud.fr/api/3/action/package_search?q=#{search}"
  response = HTTParty.get(url)
  data = response.parsed_response["result"]["results"]
  puts data.length
  while i < data.length
    t << data[i]["title"]
    i = i + 1
  end
  
  return t
end

  def access_my_collection_only
    unless current_user && (params[:user_id].to_i == current_user.id)
      redirect_to root_url, alert: 'Accessing or modifying another user data is not allowed.'
    end
  end
end
