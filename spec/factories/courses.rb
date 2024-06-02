FactoryBot.define do
  factory :course do
    title {Faker::Educator.subject}
  end
end