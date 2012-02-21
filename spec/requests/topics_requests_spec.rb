require 'spec_helper'

describe "topics requests" do
  let(:topic){ Fabricate(:topic, :published => true) }

  context "GET show" do
    before(:each){ visit topic_path(topic) }

    it "displays the topic" do
      page.should have_content(topic.title)
    end
  end

  context "GET new" do
    before(:each){ visit new_topic_path }

    it "displays the form with a title field" do
      page.should have_css("input#topic_title")
    end

    context "when clicking submit" do
      context "with valid attributes" do
        let(:title) { Faker::Lorem.words(1).first }

        before(:each) do
          fill_in('topic_title', :with => title )
          click_button('topic_submit')         
        end

        it "displays the created topic's show page" do
          within("#title") do
            page.should have_content(title)
          end
        end
      end

      context "with invalid attributes" do
        before(:each) do
          click_button('topic_submit')         
        end

        it "returns to the form" do
          page.should have_field('topic_title')
        end
      end
    end
  end
end