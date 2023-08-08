FactoryBot.define do
  factory :library do
    name { Faker::Company.name }
  end
end