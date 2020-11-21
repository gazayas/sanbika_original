# TODO: Needs some work since the models have changed a bit.

song_params = []
15.times do |n|
  song_params << [
    title: "賛美しよう #{n}",
    key: 'C',
    song_body: "C   Am   F   Cb \n 賛美歌の歌詞はここに入ります",
    video: ''
  ]

  song_params << [
    title: "Title #{n}",
    key: 'C',
    song_body: "C   Am   F   Cb \n Lyrics go here",
    video: ''
  ]
end

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

  user.songs.create!(song_params)

  user.confirmed_at = Time.zone.now

  user
end
