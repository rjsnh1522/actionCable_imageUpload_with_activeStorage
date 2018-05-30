require 'faker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'password123'
    password_confirmation { password }
  end

  factory :image do 
  	user_id {Faker::Number.non_zero_digit}
  end
end
