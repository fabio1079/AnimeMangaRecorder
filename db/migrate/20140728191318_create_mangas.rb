class CreateMangas < ActiveRecord::Migration
  def change
    create_table :mangas do |t|
      t.string :title
      t.string :volume
      t.integer :chapter
      t.string :chapter_title

      t.timestamps
    end
  end
end
