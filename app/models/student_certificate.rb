class StudentCertificate < ApplicationRecord
  belongs_to :student
  belongs_to :course_enrollment

  validates :is_publish, inclusion: {in: [true, false]}
end
