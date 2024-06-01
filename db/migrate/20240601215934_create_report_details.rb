class CreateReportDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :report_details do |t|
      t.references :report, null: false, foreign_key: true
      t.references :report_criterium, null: false, foreign_key: true
      t.integer :score, null: false, default: 0
      t.text :description, null: false
      t.timestamps
    end
  end
end
