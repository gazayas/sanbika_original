FactoryBot.define do
  factory :song do
    title '歌です'
    title_yomikata 'うたです'
    artist '歌手'
    artist_yomikata 'かしゅ'
    key 'C'
    song_body '歌詞はここに入ります'
    video 'https://youtu.be/itdgtFALCpo'
  end
end
