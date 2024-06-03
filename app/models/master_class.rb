class MasterClass < ApplicationRecord
  belongs_to :teacher
  has_many :master_class_students
  has_many :students, through: :master_class_students
  has_many :course_enrollments

  validates :name, presence: true, length: {in: 1..50}
  validates :is_active, inclusion: { in: [true, false] }
  validates :teacher_id, presence: true
end
