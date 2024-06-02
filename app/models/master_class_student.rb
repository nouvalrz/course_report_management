class MasterClassStudent < ApplicationRecord
  self.table_name = "master_classes_students"
  belongs_to :master_class
  belongs_to :student

  validates :master_class_id, presence: true
  validates :student_id, presence: true
end
