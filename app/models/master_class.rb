class MasterClass < ApplicationRecord
  belongs_to :teacher
  has_many :master_class_students
  has_many :students, through: :master_class_students
  has_many :course_enrollments
  has_many :courses, through: :course_enrollments

  accepts_nested_attributes_for :course_enrollments, allow_destroy: true

  validates :name, presence: true, length: {in: 1..50}
  validates :is_active, inclusion: { in: [true, false] }
  validates :teacher_id, presence: true

  scope :active, -> {where('is_active = true')}

  def destroy
    course_enrollments.each(&:destroy)
    super
  end
end
