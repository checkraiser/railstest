require 'spec_helper'
include RequestHelpers::Helpers
feature 'User Events Page', %q{
	As a signed in User
	I want to see my Events
	on my events Page
} do
	background do 
		@user = FactoryGirl.create(:user)
		@event = FactoryGirl.create(:event, :user => @user)
		login_user(@user)
	end

	scenario "User is signed in" do 
		visit events_path
		page.should have_content(@user.name)
		page.should have_content(@event.name)
	end


end