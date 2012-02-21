class TopicsController < ApplicationController
  assume(:topic) do
    params[:id] ? TopicDecorator.find(params[:id]) : Topic.new
  end

  def show
  end

  def new
  end

  def create
    new_topic = Topic.new(params[:topic])
    if new_topic.save
      redirect_to topic_path(new_topic)
    else
      render :new
    end
  end

end
