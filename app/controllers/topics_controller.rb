class TopicsController < ApplicationController

    def index
        @topics = Topic.with_attached_main_picture.all
    end

    def show
        @topic = Topic.with_attached_main_picture.find(params[:id])
    end

    def create
        
    end

    def update
        
    end


end
