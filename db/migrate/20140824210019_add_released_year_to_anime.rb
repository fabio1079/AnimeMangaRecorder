class AddReleasedYearToAnime < ActiveRecord::Migration
  def change
    add_column :animes, :released_year, :integer
  end
end
