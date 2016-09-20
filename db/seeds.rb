# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

song_params = [
  [
    title: '賛美しよう',
    title_yomikata: 'さんびしよう',
    key: 'C',
    song_body: '*C*   *Am*   *F*   *Cb*　賛美歌の歌詞はここに入ります'
  ],
  [
    title: '愛である',
    title_yomikata: 'あいである',
    key: 'C',
    song_body: '*C*   *Am*   *F*   *Cb*　賛美歌の歌詞はここに入ります'
  ]
]

99.times do |n|
  name  = "user#{n}"
  email = "example-#{n+1}@example.org"
  password = "user_#{n}"
  user = User.create!(
    name:  name,
    email: email,
    password:              password,
    password_confirmation: password
    )
  2.times do |n|
    user.songs.create!(song_params[n])
  end
  user.confirmed_at = Time.zone.now
  user
end
