class ReportDetail < ApplicationRecord
  belongs_to :report
  belongs_to :report_criterium

  validates :score, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  validates :description, presence: true, length: {in: 1..500}
end
