require 'spec_helper'
include RequestHelpers::Helpers
feature 'Delete Event', %q{
	As a registered user, 
	I want to delete an Event
} do 
	background do 
		Capybara.current_driver = :selenium
		@user = FactoryGirl.create(:user)
		@event = FactoryGirl.create(:event, :user => @user, 
			:name => "Dead Event Walking")
		login_user @user
	end
	after do 
		Capybara.use_default_driver
	end
	scenario "Delete Event" do 
		page.should have_content("Dead Event Walking")
		page.should have_selector("form[action='/events/#{@event.id}']")
		page.execute_script(
			'window.confirm = function() { return true; }'
		)
		click_button 'X'
		page.should_not have_content("Dead Event Walking")
	end
end