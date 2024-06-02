FactoryBot.define do
  factory :teacher do
    full_name_data = Faker::Name.name
    full_name {full_name_data}
    association :user, factory: :user, username: full_name_data.downcase.gsub(" ", ""), role: "teacher"
  end
end