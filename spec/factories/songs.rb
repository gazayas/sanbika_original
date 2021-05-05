FactoryBot.define do
  factory :song do
    sequence(:title) {|i| "タイトル#{i}" }
    key { ['C', 'C♯', 'D', 'D♯', 'E', 'F', 'F♯', 'G', 'G♯', 'A', 'A♯', 'B'].sample }
    sequence(:song_body) {|i| "#{key}\n歌詞#{i}" }
    video { 'https://youtu.be/itdgtFALCpo' }
  end
end
