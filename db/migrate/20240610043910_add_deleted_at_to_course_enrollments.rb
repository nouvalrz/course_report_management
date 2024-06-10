class AddDeletedAtToCourseEnrollments < ActiveRecord::Migration[7.1]
  def change
    add_column :course_enrollments, :deleted_at, :datetime
  end
end
