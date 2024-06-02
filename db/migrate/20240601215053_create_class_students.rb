class CreateClassStudents < ActiveRecord::Migration[7.1]
  def change
    create_join_table :master_classes, :students
  end
end
