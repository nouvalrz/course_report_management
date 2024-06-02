class User < ApplicationRecord
  has_secure_password

  has_one :teacher

  validates :username, presence: true, uniqueness: true, length: {in: 8..30}
  validates :password, presence: true, length: {in: 8..30}
  validates :role, presence: true, inclusion: {in: %w(teacher admin), message: "%{value} is not a valid role"}
end
