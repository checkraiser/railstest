require 'spec_helper'

describe Event do
  it "should belong to a user" do 
  	event = FactoryGirl.build(:event, :user => nil)
  	event.valid?.should be_false
  	event.errors[:user].should include("can't be blank")
  	event.user = User.new
  	event.valid?.should be_true
  end

  describe "User Event" do 
  	before(:each) do 
  		@user = FactoryGirl.create(:user)
  	end
  	it "can be built for a user" do
  		lambda {
  			@user.events.build(:name => "A new event")
  		}.should change(@user.events, :length).by(1)
  	end

  	it "can be removed from a user" do
  		event = @user.events.build(:name => "A short event")
  		lambda {
  			@user.events.delete(event)
  		}.should change(@user.events, :length).by(-1)
  	end 
  end
end
