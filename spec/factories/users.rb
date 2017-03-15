FactoryGirl.define do
  factory :user do
    sequence(:name) { |i| "example#{i}" }
    sequence(:email) { |i| "example#{i}@email.com" }
    sequence(:password) { |i| "password#{i}" }
    sequence(:password_confirmation) { |i| "password#{i}" }
    # user_image: 
  end
end
