require 'spec_helper'

describe StandardDecorator do
   before do 
    c = ApplicationController.new
    c.request = ActionDispatch::TestRequest.new
    c.set_current_view_context
  end

  let(:standard){ Fabricate(:standard) }
  let(:standard_decorator){ StandardDecorator.decorate(standard) }

  describe '#delete_link' do
    it "creates a delete link" do
      standard_decorator.delete_link.should include('data-method="delete"')
    end

    it "has a properly formatted CSS id" do
      standard_decorator.delete_link.should include("id=\"delete_#{ dom_id(standard) }\"")
    end
  end

  describe '#edit_link' do
    it "creates an edit link" do
      standard_decorator.edit_link.should include("#{standard.to_param}/edit")
    end

    it "has a properly formatted CSS id" do
      standard_decorator.edit_link.should include("id=\"edit_#{ dom_id(standard) }\"")
    end
  end
end
