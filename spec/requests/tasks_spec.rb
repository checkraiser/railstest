require 'spec_helper'

describe "Tasks" do
  describe "GET /tasks" do
    it "displays takss" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      Task.create!(:name => "paint fence")
      visit "/tasks"
      page.should have_content("paint fence")
    end

    it "support js", :js => true do 
    	visit "/tasks"
    	click_link "test js"
    	page.should have_content("ok")
    end
  end
end
