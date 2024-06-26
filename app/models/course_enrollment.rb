class CourseEnrollment < ApplicationRecord
  default_scope { where(deleted_at: nil) }

  belongs_to :master_class
  belongs_to :course
  has_many :reports
  has_many :student_certificates

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :master_class_id, presence: true
  validates :course_id, presence: true

  scope :active, -> { where('start_date <= ? AND end_date >= ?', Date.today, Date.today) }

  validate :end_date_after_start_date

  def destroy
    update(deleted_at: Time.current)
  end

  def really_destroy!
    super()
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def reportable?
    10.days.from_now.to_date >= self.end_date && self.end_date <= self.end_date + 30.days
  end

end
