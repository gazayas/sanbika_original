=begin
song_params = [
  [
    title: '賛美しよう',
    title_yomikata: 'さんびしよう',
    key: 'C',
    song_body: '<em>C   Am   F   Cb</em><br/>賛美歌の歌詞はここに入ります'
  ],
  [
    title: 'タイトルです',
    title_yomikata: 'たいとるです',
    key: 'C',
    song_body: '<em>C   Am   F   Cb</em><br/>賛美歌の歌詞はここに入ります'
  ]
]

99.times do |n|
  name  = "user#{n}"
  email = "user#{n}@example.com"
  password = "password"
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
=end

