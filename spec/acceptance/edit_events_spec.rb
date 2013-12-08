require 'spec_helper'
include RequestHelpers::Helpers

feature 'Select Event', %q{
	As a registered user
	I want to select an Event
} do 
	background do 
		@user = FactoryGirl.create(:user)
		@event = FactoryGirl.create(:event, :user => @user)
		login_user @user
	end

	scenario "Select event" do 
		page.should have_link(@event.name)
		click_link @event.name

		page.should have_selector("li.selected", :text => @event.name)
		find_field('event[name]').value.should eq @event.name
		find_field('event[description]').value.should eq @event.description
	end
end

feature 'Edit Event', %q{
	As a registered user
	I want to edit a selected Event
} do 
	background do 
		@user = FactoryGirl.create(:user)
		@event = FactoryGirl.create(:event, :user => @user)
		login_user @user
		click_link @event.name
	end

	scenario "Edit Event" do 
		fill_in "Name", :with => "Edited Event"
		click_button "Update Event"
		page.should have_link("Edited Event")
	end
end