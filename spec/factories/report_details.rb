FactoryBot.define do
  factory :report_detail do

    association :report_criterium, factory: :report_criterium
    score {Faker::Number.between(from: 10, to: 100)}
    description {Faker::Quote.famous_last_words}
  end
end