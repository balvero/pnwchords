json.extract! song, :id, :title, :key, :body, :artist_id, :created_at, :updated_at
json.url song_url(song, format: :json)
