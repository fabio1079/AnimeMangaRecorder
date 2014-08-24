class AddLastVisitedUrlToAnime < ActiveRecord::Migration
  def change
    add_column :animes, :last_visited_url, :string
  end
end
