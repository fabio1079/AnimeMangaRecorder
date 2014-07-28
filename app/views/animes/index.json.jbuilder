json.array!(@animes) do |anime|
  json.extract! anime, :id, :title, :season, :season_title, :episode
  json.url anime_url(anime, format: :json)
end
