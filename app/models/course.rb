class Course < ApplicationRecord
  has_many :course_enrollments

  validates :title, presence: true, length: {in: 5..50}, uniqueness: true
  validates :is_active, inclusion:{in: [true, false]}
end
