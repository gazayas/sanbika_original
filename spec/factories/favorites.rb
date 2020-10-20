FactoryBot.define do
  factory :favorite do
    value { false }
    references { "" }
    references { "MyString" }
    user { "MyString" }
  end
end
