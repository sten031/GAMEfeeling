FactoryBot.define do
  factory :user do
    name {"testtest"}
    sequence(:email) { |n| "test#{n}@test.com"}
    password {"testpassword"}
    introduction {"testintroduction"}
  end
end
