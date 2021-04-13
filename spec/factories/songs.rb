FactoryBot.define do
  factory :song do
    title  { '歌のタイトル' }
    key { 'C' }
    song_body { '歌詞はここに入ります' }
    video { 'https://youtu.be/itdgtFALCpo' }
  end
end
