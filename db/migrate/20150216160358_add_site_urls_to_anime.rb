class AddSiteUrlsToAnime < ActiveRecord::Migration
  def change
    add_column :animes, :sites, :text
  end
end
