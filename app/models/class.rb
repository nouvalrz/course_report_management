class Class < ApplicationRecord
  belongs_to :teacher
  has_many :class_students
  has_many :students, through: :class_students
  has_many :course_enrollments

  validates :name, presence: true, length: {in: 5..50}
  validates :is_active, inclusion: { in: [true, false] }
  validates :teacher_id, presence: true
end