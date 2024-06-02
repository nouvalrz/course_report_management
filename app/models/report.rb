class Report < ApplicationRecord
  belongs_to :course_enrollment
  belongs_to :teacher
  belongs_to :student
  has_many :report_details

  validates :average_score, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  validates :is_publish, inclusion: { in: [true, false] }
  validates :class_enrollment_id, presence: true
  validates :teacher_id, presence: true
  validates :student_id, presence: true
end
