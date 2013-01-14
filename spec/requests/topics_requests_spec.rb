require 'spec_helper'

describe "topics requests" do
  let(:topic){ Fabricate(:topic) }
  let(:topic_with_standards){ Fabricate(:topic_with_standards) }

  context '#index' do
    let!(:topics){ [0...3].collect{ Fabricate(:topic) } }

    before(:each){ visit topics_path }

    it "displays active topics" do      
      within('#topics') do
        topics.each do |t|
          page.should have_link(t.title, :href => topic_path(t))
        end
      end
    end
  end

  context "#show" do
    it "displays the topic" do
      visit topic_path(topic)
      page.should have_content(topic.title)
    end

    it "displays the child standards" do
      visit topic_path(topic_with_standards)
      within('#standards') do
        topic_with_standards.standards.each do |standard|
          page.should have_link(standard.title, :href => standard_path(standard))
        end
      end
    end

    it "has the form to create additional standards" do
      visit topic_path(topic)
      within('#new_standard') do
        page.should have_field('standard_title')
        page.should have_field('standard_details')
        page.should have_button('Create Standard')
      end
    end

    it "triggers the standards#create method" do
      pending "Can't get this to work without complaining about a missing create template"
      visit topic_path(topic)
      fill_in('standard_title', :with => "helllo, world")
      fill_in('standard_details', :with => "these are the details")
      StandardsController.any_instance.should_receive(:create)
      click_button('standard_submit')
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
          click_button('Create Topic')         
        end

        it "displays the created topic's show page" do
          within("#title") do
            page.should have_content(title)
          end
        end
      end

      context "with invalid attributes" do
        before(:each) do
          click_button('Create Topic')         
        end

        it "returns to the form" do
          page.should have_field('topic_title')
        end
      end
    end
  end
end