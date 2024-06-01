class CreateClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :classes do |t|
      t.references :teacher, null: false, foreign_key: true
      t.string :name, null: false
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end
