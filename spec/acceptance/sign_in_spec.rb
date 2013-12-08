require 'spec_helper'
include RequestHelpers::Helpers

feature 'Sign In', %q{

  } do 
  background do 

  end
  scenario "Successful Sign In" do 
    #click_sign_in
    user = FactoryGirl.create(:user)
    login_user(user)
    current_path.should == user_root_path
    page.should have_link("My Events", :href => user_root_path)
  end

  scenario "Unsuccessful Sign In" do 
    click_sign_in
   
    fill_in 'Email', :with => 'hacker@getyou.com'
    fill_in 'Password', :with => 'badpassword'
    click_on 'Sign in'
    current_path.should == user_session_path
    page.should have_content('Invalid email or password')

  end
end