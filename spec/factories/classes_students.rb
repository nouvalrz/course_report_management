FactoryBot.define do
  factory :classes_student do
    association :class, factory: :class
    association :student, factory: :student
  end
end