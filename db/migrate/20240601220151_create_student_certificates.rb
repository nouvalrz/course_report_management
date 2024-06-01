class CreateStudentCertificates < ActiveRecord::Migration[7.1]
  def change
    create_table :student_certificates do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course_enrollment, null: false, foreign_key: true
      t.boolean :is_publish, null: false, default: true
      t.timestamps
    end
  end
end
