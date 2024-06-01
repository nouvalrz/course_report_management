class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :full_name, null: false
      t.string :student_number, null: false
      t.date :date_of_birth, null: false
      t.timestamps
    end
  end
end
