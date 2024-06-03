class Teacher < ApplicationRecord
  belongs_to :user

  # For creating user
  accepts_nested_attributes_for :user

  has_many :master_classes
  has_many :reports

  validates :full_name, presence: true
  # validates :user_id, presence: true, uniqueness: true

end
