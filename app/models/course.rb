class Course < ApplicationRecord
  has_many :course_enrollments

  validates :title, presence: true, length: {in: 5..50}
  validates :is_active, presence: true, inclusion:{in: [true, false]}
end
