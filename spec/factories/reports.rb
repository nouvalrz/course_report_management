FactoryBot.define do
  factory :report do
    association :course_enrollment, factory: :course_enrollment
    association :teacher, factory: :teacher
    association :student, factory: :student
    average_score {0.0}
    after(:create) do |report|
      scores = []
      3.times do
        detail = create(:report_detail, report_id: report.id)
        scores << detail.score
      end
      average_score = scores.sum / scores.size
      report.update(average_score: average_score)
    end
  end

end