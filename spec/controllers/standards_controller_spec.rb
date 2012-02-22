require 'spec_helper'

describe StandardsController do
  context "POST create" do
    before(:all) { @valid_attributes = HashWithIndifferentAccess.new(Fabricate(:standard, :parent_id => 1).attributes) }
    let!(:valid_attributes){ @valid_attributes }
    let!(:invalid_attributes){ valid_attributes.merge({ :title => nil }) }

    context "with valid attributes" do
      it "creates the standard" do
        expect{ post :create, :standard => valid_attributes }.to change(Standard, :count).by(1)
      end

      it "returns to the parent" do
        post :create, :standard => valid_attributes
        response.should redirect_to(topic_path(valid_attributes["parent_id"]))
      end

      it "sets an affirmative message" do
        post :create, :standard => valid_attributes
        flash[:message].should be
      end
    end

    context "with invalid attributes" do
      it "returns to the parent" do
        post :create, :standard => invalid_attributes
        response.should redirect_to(topic_path(invalid_attributes["parent_id"]))
      end

      it "does not create a standard" do
        expect{ post :create, :standard => invalid_attributes }.to_not change(Standard, :count)
      end

      it "sets an error message" do
        post :create, :standard => invalid_attributes
        flash[:message].should_not be
        flash[:warning].should be
      end
    end
  end
end
