require 'spec_helper'
include RequestHelpers::Helpers
feature 'Home page', %q{
	As an unregistered unregistered
	I want to see the home/landing page
} do 
  background do 
    visit "/"
  end
  scenario "Home page" do 
    visit "/"
    page.should have_link('Sign In')
    page.should have_title("Loccasions")
    page.should have_content('What is Loccasions?')
  end
end

feature 'Sign In', %q{

  } do 
  background do 

  end
  scenario "Successful Sign In" do 
    click_sign_in
    FactoryGirl.create(:user)
    fill_in 'Email', :with => 'testy@test.com'
    fill_in 'Password', :with => 'password'
    click_on('Sign in')
    current_path.should == user_root_path
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