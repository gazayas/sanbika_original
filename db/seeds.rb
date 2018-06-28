song_params = [
  [
    title: '賛美しよう',
    artist: '誰か',
    key: 'C',
    song_body: "C   Am   F   Cb \n 賛美歌の歌詞はここに入ります",
    video: ''
  ],
  [
    title: 'Title',
    artist: 'Someone',
    key: 'C',
    song_body: "C   Am   F   Cb \n Lyrics go here",
    video: ''
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
  
  30.times do |n|
    user.songs.create!(song_params[(n % 2) - 1])
  end
  
  user.confirmed_at = Time.zone.now
  
  user
end
