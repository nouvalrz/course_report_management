class CreateClassStudents < ActiveRecord::Migration[7.1]
  def change
    create_join_table :classes, :students
  end
end
