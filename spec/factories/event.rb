require 'factory_girl'
FactoryGirl.define do 
  factory :event do 
    name 'Test Event'
    user
  end
end