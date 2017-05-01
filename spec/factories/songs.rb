FactoryGirl.define do
  factory :song do
    title '歌です'
    title_yomikata 'うたです'
    artist '歌手'
    artist_yomikata 'かしゅ'
    key 'C'
    song_body '歌詞はここに入ります'
    video '<iframe width="560" height="315" src="https://www.youtube.com/embed/itdgtFALCpo?ecver=1" frameborder="0" allowfullscreen></iframe>'
  end
end
