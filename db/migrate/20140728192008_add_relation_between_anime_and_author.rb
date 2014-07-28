class AddRelationBetweenAnimeAndAuthor < ActiveRecord::Migration
  def up
    add_column :animes, :author_id, :integer
  end

  def down
    remove_column :animes, :author_id
  end
end
