class CreateAnimesTags < ActiveRecord::Migration
  def change
    create_table :animes_tags do |t|
      t.references :anime, index:true
      t.references :tag, index:true

      t.timestamps
    end
  end
end
