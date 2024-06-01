class CreateCourseEnrollments < ActiveRecord::Migration[7.1]
  def change
    create_table :course_enrollments do |t|
      t.references :class, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.timestamps
    end
  end
end
