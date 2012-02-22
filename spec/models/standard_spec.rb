require 'spec_helper'

describe Standard do

  it "is not valid without a title" do
    baddie = Fabricate(:standard)
    baddie.title = nil
    baddie.should_not be_valid
  end
  
end
