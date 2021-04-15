FactoryBot.define do
  factory :user do
    sequence(:username) { |i| "example#{i}" }
    sequence(:email) { |i| "example#{i}@email.com" }
    sequence(:password) { |i| "password#{i}" }
    sequence(:password_confirmation) { password }

    factory :user_with_populated_set_lists do
      transient do
        songs_count { 3 }
        set_list_count { 5 }
        set_list_song_count { 3 }
      end

      after :create do |user, evaluator|
        create_list(
          :song,
          evaluator.songs_count,
          user: user
        )

        create_list(
          :set_list,
          evaluator.set_list_count,
          user: user
        )

        # TODO: Only the first set list has songs. Populate the other set lists.
        evaluator.set_list_song_count.times do |i|
          create(:set_list_song, key: user.songs[i].key, song: user.songs[i], set_list: user.set_lists.first)
        end
      end
    end
  end
end
