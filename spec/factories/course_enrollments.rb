FactoryBot.define do
  factory :course_enrollment do
    association :master_class, factory: :master_class
    association :course, factory: :course
    start_date {Faker::Date.between(from: 3.month.ago, to: 3.month.from_now)}
    end_date {Faker::Date.between(from: 4.month.from_now, to: 7.month.from_now)}
  end
end