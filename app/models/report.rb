class Report < ApplicationRecord
  belongs_to :course_enrollment
  belongs_to :teacher
  belongs_to :student
  has_many :report_details

  accepts_nested_attributes_for :report_details, allow_destroy: true

  validates :average_score, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, allow_nil: true, allow_blank: true
  validates :is_publish, inclusion: { in: [true, false] }
  validates :course_enrollment_id, presence: true
  validates :teacher_id, presence: true
  validates :student_id, presence: true

  def self.report_exist?(course_enrollment_id, student_id)
    Report.find_by(course_enrollment_id: course_enrollment_id, student_id: student_id).present?
  end

  def calculateAvgScore
    self.average_score = self.report_details.sum(:score) / self.report_details.count
    self.save
  end
end
