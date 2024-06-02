FactoryBot.define do
  factory :master_class_student do
    association :master_class, factory: :master_class
    association :student, factory: :student
  end
end