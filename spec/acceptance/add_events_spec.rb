require 'spec_helper'
include RequestHelpers::Helpers
feature 'Add Events', %q{
	As a registered user
	I want to add Events
} do 
	background do 
		login_user FactoryGirl.create(:user)
	end
	scenario "Add basic event" do 
		fill_in "Name", :with => "New Event"
		fill_in "Description", :with => "This is my new event"
		click_button "Create Event"
		page.should have_content("New Event")
		page.should have_content("This is my new event")
		page.should have_selector("ul > li")
		page.current_path.should == events_path
	end
end