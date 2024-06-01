class CreateTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :teachers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :full_name, null: false
      t.timestamps
    end
  end
end
