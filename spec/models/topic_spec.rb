require 'spec_helper'

describe Topic do
  let!(:published){ Fabricate(:topic, :published => true ) }
  let!(:unpublished){ Fabricate(:topic, :published => false ) }

  context "attributes" do
    it { should respond_to(:title) }
    it { should respond_to(:published) }

    it "is not valid without a title" do
      baddie = published.clone
      baddie.title = nil
      baddie.should_not be_valid
    end
  end

  context ".available" do
    it "fetches published topics" do
      Topic.available.should include(published)
    end
    
    it "does not fetch unpublished topics" do
      Topic.available.should_not include(unpublished)
    end
  end
end
