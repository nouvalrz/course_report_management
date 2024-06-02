FactoryBot.define do
  factory :student do
    full_name {Faker::Name.name}
    date_of_birth {Faker::Date.between(from: 18.years.ago, to: 5.years.ago)}
  end
end