FactoryBot.define do
  factory :set_list do
    sequence(:title) {|i| "セットリスト#{i}" }
    # Remaining attributes are defined in the User factory
  end
end
