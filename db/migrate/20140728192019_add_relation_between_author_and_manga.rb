class AddRelationBetweenAuthorAndManga < ActiveRecord::Migration
  def up
    add_column :mangas, :author_id, :integer
  end

  def down
    remove_column :mangas, :author_id
  end
end
