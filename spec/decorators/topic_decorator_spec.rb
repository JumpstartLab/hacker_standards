require 'spec_helper'

describe TopicDecorator do
  before do 
    c = ApplicationController.new
    c.request = ActionDispatch::TestRequest.new
    c.set_current_view_context
  end

  let(:topic){ TopicDecorator.decorate(Fabricate(:topic)) }

  context "#link" do
    it 'generates and HTML link' do
      topic.link.should include("<a")
    end

    it 'includes a DOM id' do
      topic.link.should include("id=\"#{dom_id(topic)}\"")
    end

  end
end
