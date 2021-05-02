FactoryBot.define do
  factory :user do
    username { "testuser" }
    email { "test@test.com" }
    password { "password" }
  end
end
