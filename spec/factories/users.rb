FactoryBot.define do
  factory :user do
    username {Faker::Name.name.downcase.gsub(" ", "")}
    password_digist {"password"}
    trait :admin do
      role { 'admin' }
    end

    trait :guest do
      role { 'guest' }
    end
  end
end

# Membuat admin user
# admin_user = FactoryBot.create(:user, :admin)

# Membuat guest user
# guest_user = FactoryBot.create(:user, :guest)