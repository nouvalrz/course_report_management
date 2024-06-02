FactoryBot.define do
  factory :student_certificate do
    association :student, factory: :student
    association :course_enrollment, factory: :course_enrollment
  end
end