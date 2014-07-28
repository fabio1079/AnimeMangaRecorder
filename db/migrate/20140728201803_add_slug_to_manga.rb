class AddSlugToManga < ActiveRecord::Migration
  def change
    add_column :mangas, :slug, :string
    add_index :mangas, :slug, unique:true
  end
end
