json.extract! song, :id, :title, :title_yomikata, :artist, :artist_yomikata, :key, :song_body, :user_id, :created_at, :updated_at
json.url song_url(song, format: :json)
