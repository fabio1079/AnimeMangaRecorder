json.array!(@mangas) do |manga|
  json.extract! manga, :id, :title, :volume, :chapter, :chapter_title
  json.url manga_url(manga, format: :json)
end
