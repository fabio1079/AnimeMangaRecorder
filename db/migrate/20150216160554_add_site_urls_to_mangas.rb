class AddSiteUrlsToMangas < ActiveRecord::Migration
  def change
    add_column :mangas, :sites, :text
  end
end
