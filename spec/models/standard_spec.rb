require 'spec_helper'

describe Standard do
  let(:standard){ Fabricate(:standard) }

  it "is not valid without a title" do
    baddie = Fabricate(:standard)
    baddie.title = nil
    baddie.should_not be_valid
  end

  it "is not valid without a parent" do
    baddie = Fabricate(:standard)
    baddie.parent = nil
    baddie.should_not be_valid
  end

  context('.count') do
    it "does not count deleted standards" do
      expect{ Fabricate(:standard, :deleted => true) }.to_not change(Standard, :count)
    end

    it "counts normal standards" do
      expect{ Fabricate(:standard) }.to change(Standard, :count)
    end
  end

  context('#children') do
    it "has children" do
      standard.should respond_to(:children)
    end

    it "can add children" do
      expect{ standard.children << Fabricate(:standard) }.to change(standard, :children_count).by(1)
    end
  end
end
