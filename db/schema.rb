# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_01_220151) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classes", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.string "name", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_classes_on_teacher_id"
  end

  create_table "classes_students", id: false, force: :cascade do |t|
    t.bigint "class_id", null: false
    t.bigint "student_id", null: false
  end

  create_table "course_enrollments", force: :cascade do |t|
    t.bigint "class_id", null: false
    t.bigint "course_id", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_id"], name: "index_course_enrollments_on_class_id"
    t.index ["course_id"], name: "index_course_enrollments_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "report_criteria", force: :cascade do |t|
    t.string "title", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "report_details", force: :cascade do |t|
    t.bigint "report_id", null: false
    t.bigint "report_criterium_id", null: false
    t.integer "score", default: 0, null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_criterium_id"], name: "index_report_details_on_report_criterium_id"
    t.index ["report_id"], name: "index_report_details_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.bigint "course_enrollment_id"
    t.bigint "teacher_id"
    t.bigint "student_id"
    t.float "average_score"
    t.boolean "is_publish", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_enrollment_id"], name: "index_reports_on_course_enrollment_id"
    t.index ["student_id"], name: "index_reports_on_student_id"
    t.index ["teacher_id"], name: "index_reports_on_teacher_id"
  end

  create_table "student_certificates", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "course_enrollment_id", null: false
    t.boolean "is_publish", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_enrollment_id"], name: "index_student_certificates_on_course_enrollment_id"
    t.index ["student_id"], name: "index_student_certificates_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "student_number", null: false
    t.date "date_of_birth", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "full_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "password_confirmation"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "classes", "teachers"
  add_foreign_key "course_enrollments", "classes"
  add_foreign_key "course_enrollments", "courses"
  add_foreign_key "report_details", "report_criteria"
  add_foreign_key "report_details", "reports"
  add_foreign_key "reports", "course_enrollments"
  add_foreign_key "reports", "students"
  add_foreign_key "reports", "teachers"
  add_foreign_key "student_certificates", "course_enrollments"
  add_foreign_key "student_certificates", "students"
  add_foreign_key "teachers", "users"
end
