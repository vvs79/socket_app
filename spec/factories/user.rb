FactoryBot.define do
  password = '123456'

  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    sequence(:user_name) { |n| "name #{n}" }
    password { password }
    password_confirmation { password }
  end
end
