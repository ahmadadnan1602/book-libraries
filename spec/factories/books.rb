FactoryBot.define do
  factory :book do
    association :library
    title { Faker::Book.title }
    author { Faker::Book.author }
    available { [true, false].sample }
    
    trait :with_user do
      association :user
    end
  end
end