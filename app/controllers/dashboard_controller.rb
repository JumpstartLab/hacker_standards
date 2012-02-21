class DashboardController < ApplicationController
  assume(:available_topics) { TopicDecorator.decorate(Topic.available) }

  def show
  end
end
