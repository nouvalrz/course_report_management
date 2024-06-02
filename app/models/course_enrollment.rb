class CourseEnrollment < ApplicationRecord
  belongs_to :class
  belongs_to :course
  has_many :reports
  has_many :student_certificates

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :class_id, presence: true
  validates :course_id, presence: true

  validate :end_date_after_start_date

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
