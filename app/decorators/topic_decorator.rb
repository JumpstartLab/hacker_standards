class TopicDecorator < ApplicationDecorator
  decorates :topic

  def link
    h.link_to topic.title, h.topic_path(topic), :id => h.dom_id(topic)
  end
end