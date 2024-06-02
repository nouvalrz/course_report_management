FactoryBot.define do
  factory :teacher do
    full_name { Faker::Name.name }
    association :user, factory: :user, role: "teacher"

    after(:build) do |teacher|
      teacher.user.username = teacher.full_name.downcase.gsub(" ", "")
    end
  end
end
