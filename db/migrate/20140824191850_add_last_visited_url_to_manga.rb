class AddLastVisitedUrlToManga < ActiveRecord::Migration
  def change
    add_column :mangas, :last_visited_url, :string
  end
end
