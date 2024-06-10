class Student < ApplicationRecord
  has_many :master_class_students
  has_many :master_classes, through: :master_class_students
  has_many :course_enrollments, through: :master_classes
  has_many :reports
  has_many :student_certificates

  accepts_nested_attributes_for :master_class_students

  validates :full_name, presence: true, length: {in: 4..100}
  validates :student_number, presence: true, uniqueness: true, length: {is: 10}
  validates :date_of_birth, presence: true

  before_validation :add_student_number

  def self.search(query)
    self.joins(:master_classes).where("students.full_name ILIKE :query OR master_classes.name ILIKE :query OR students.student_number ILIKE :query", query: "%#{query.downcase}%")
  end

  private

  def dob_cant_be_in_future
    if self.date_of_birth.present? && self.date_of_birth > Date.today
      errors.add :date_of_birth, "can't be in the future"
    end
  end

  private
  def add_student_number
    #   Format : 2406020001
    today = Date.today.to_s.gsub("-", "").slice(2..-1)
    student_number = nil
    while student_number.nil? || Student.where(student_number: student_number).present?
      student_number = "#{today}#{rand.to_s[2..5]}"
    end
    self[:student_number] = student_number
  end

end
