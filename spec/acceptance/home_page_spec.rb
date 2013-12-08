require 'spec_helper'
feature 'Home page', %q{
	As an unregistered unregistered
	I want to see the home/landing page
} do 
  background do 

  end
  scenario "Home page" do 
    visit "/"
    page.should have_link('Sign in')
    page.should have_title("Loccasions")
    page.should have_content('What is Loccasions?')
  end
end