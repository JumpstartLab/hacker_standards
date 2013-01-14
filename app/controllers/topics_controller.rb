class TopicsController < ApplicationController
  assume(:topic) do
    params[:id] ? TopicDecorator.find(params[:id]) : Topic.new
  end

  assume(:topics) do
    TopicDecorator.decorate(Topic.available)
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

  def index
  end
end
