class CreateMangasTags < ActiveRecord::Migration
  def change
    create_table :mangas_tags do |t|
      t.references :manga, index:true
      t.references :tag, index:true

      t.timestamps
    end
  end
end
