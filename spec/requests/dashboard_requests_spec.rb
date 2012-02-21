require 'spec_helper'

describe "dashboard" do
  before(:all) do
    10.times{ Fabricate(:topic, :published => true) }
    5.times{ Fabricate(:topic, :published => false) }
  end

  before(:each) do
  	visit "/"
  end

  it "lists the available topics" do
  	within('#topics') do
      Topic.available.each do |topic|
        page.should have_link(dom_id(topic), :href => topic_path(topic))
    	end
    end
  end

end