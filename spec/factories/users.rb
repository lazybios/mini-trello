require 'faker'

FactoryGirl.define do
  factory :user do
    username 'test'
    password 'password'
    password_confirmation { password }
    token 'usertoken'

    factory :fake_user do
      username { Faker::Internet.user_name}
      password_confirmation 'fake'
    end
  end
end
