class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.references :course_enrollment, index: true, foreign_key: true
      t.references :teacher, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.float :average_score
      t.boolean :is_publish, default: true, null: false
      t.timestamps
    end
  end
end
