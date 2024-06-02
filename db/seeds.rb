# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Seed for master users
User.destroy_all
User.create!(username: "admin@master", password: "password", role: "admin", password_confirmation: "password")
User.create!(username: "teacher@master", password: "password", role: "teacher", password_confirmation: "password")

# Seed all using factory
FactoryBot.create_list(:report, 30)
FactoryBot.create_list(:master_class_student, 30)
FactoryBot.create_list(:student_certificate, 10)
# FactoryBot.create_list(:master_class_student, 30)
# FactoryBot.create_list(:course_enrollment, 30)
# FactoryBot.create_list(:student_certificate, 30)


