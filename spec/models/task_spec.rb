require 'spec_helper'

describe Task do
  it "should have a name and boolean property" do 
  	task = Task.create!(name: "Alexa", completed: true)
  	task.should be_valid
  end

  it "should be created with at least a name" do 
  	task = Task.new
  	task.should be_invalid
  end
end
