FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    encrypted_password { Faker::Internet.password(30, 40) }
    password { Faker::Internet.password(30, 40) }
    reset_password_token { Faker::Internet.password(10, 20) }
    reset_password_sent_at { Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today) }
    remember_created_at { Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today) }
    sign_in_count { Faker::Number.between(1, 150) }
    current_sign_in_at { Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today) }
    last_sign_in_at { Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today) }
    current_sign_in_ip { Faker::Internet.ip_v4_address }
    last_sign_in_ip { Faker::Internet.ip_v4_address }
    created_at { Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today) }
    updated_at { Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today) }
  end
end
