require 'spec_helper'

describe "standards requests" do
  let(:standard){ Fabricate(:standard) }

  describe '#show' do
    before(:each){ visit standard_path(standard) }

    it "displays the standard title" do
      within('#title') do
        page.should have_content( standard.title )
      end
    end

    it "displays the standard details" do
      within('#details') do
        page.should have_content( standard.details )
      end
    end

    context 'actions' do
      it "deletes a standard when the delete link is clicked" do
        expect{ click_link(dom_id(standard, "delete")) }.to change(Standard, :active_count).by(-1)
      end

      it "loads the edit form when the edit link is clicked" do
        click_link(dom_id(standard, "edit"))
        current_path.should eq(edit_standard_path(standard))
      end
    end

    context 'children' do
      it 'displays child standards' do
        within('#children') do
          standard.children.each do |child|
            page.should have_link(dom_id(child))
          end
        end
      end

      it 'displays the form to create a child standard'
    end
  end

  describe '#edit' do
    before(:each){ visit edit_standard_path(standard) }

    it 'displays the title field' do
      page.should have_field('standard_title')
    end

    it 'displays the details field' do
      page.should have_field('standard_details')
    end

    it 'updates the title when submit is clicked' do
      new_title = standard.title.reverse
      fill_in('standard_title', :with => new_title)
      click_button('Update Standard')
      within '#title' do
        page.should have_content(new_title)
      end
      page.should have_css("#flash .info")
    end

    it 'returns to the form when the input is invalid' do
      fill_in('standard_title', :with => "")
      click_button('Update Standard')
      within '#title' do
        page.should have_content('Edit Standard')
      end
      page.should have_css("#flash .error")
    end
  end
end
