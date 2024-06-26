class Teacher < ApplicationRecord
  belongs_to :user

  # For creating user
  accepts_nested_attributes_for :user

  has_many :reports
  has_many :master_classes
  has_many :students, through: :master_classes

  validates :full_name, presence: true
  # validates :user_id, presence: true, uniqueness: true


  def self.search(query)
    self.where("full_name ILIKE ?", "%#{query.downcase}%")
  end
end
