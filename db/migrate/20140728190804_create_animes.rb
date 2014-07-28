class CreateAnimes < ActiveRecord::Migration
  def change
    create_table :animes do |t|
      t.string :title
      t.string :season
      t.string :season_title, default:""
      t.integer :episode

      t.timestamps
    end
  end
end
