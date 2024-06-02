class ReportCriterium < ApplicationRecord
  has_many :report_details

  validates :title, presence: true, length: {in: 5..50}
  validates :is_active, inclusion: {in: [true, false]}
end
