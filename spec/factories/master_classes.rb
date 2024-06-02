FactoryBot.define do
  factory :master_class do
    association :teacher, factory: :teacher
    name {"#{rand(1..20)}#{('a'..'z').to_a.sample.upcase}"}
  end
end
