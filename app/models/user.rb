class User < ApplicationRecord
  has_secure_password

  has_one :teacher

  validates :username, presence: true, uniqueness: true, length: {in: 8..500}, format: { without: /\s/, message: "cannot contain spaces" }
  validates :password, length: {in: 8..30}, presence: true, if: :password_required?
  validates :role, presence: true, inclusion: {in: %w(teacher admin), message: "%{value} is not a valid role"}

  ROLES = { admin: 'admin', teacher: 'teacher' }.freeze

  enum role: ROLES
  def role?(param)
    self.role == param.to_s
  end

  private
  def password_required?
    new_record? || !password.nil?
  end

end
