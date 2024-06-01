class CreateReportCriteria < ActiveRecord::Migration[7.1]
  def change
    create_table :report_criteria do |t|
      t.string :title, null: false
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end
