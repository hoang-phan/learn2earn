FactoryGirl.define do
  factory :user do
    user_name { "#{Faker::Lorem.word}_1W_test" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8, 10) }
  end  
end
