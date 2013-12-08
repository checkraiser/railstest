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

