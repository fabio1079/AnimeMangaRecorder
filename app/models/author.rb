class Author < ActiveRecord::Base
  has_many :animes
  has_many :mangas
end
