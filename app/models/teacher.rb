class Teacher < ApplicationRecord
  belongs_to :user

  has_many :master_classes
  has_many :reports

  validates :full_name, presence: true
  validates :user_id, presence: true, uniqueness: true
end
