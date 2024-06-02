class ClassStudent < ApplicationRecord
  belongs_to :class
  belongs_to :student

  validates :class_id, presence: true
  validates :student_id, presence: true
end
