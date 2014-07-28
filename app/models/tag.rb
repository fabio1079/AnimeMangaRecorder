class Tag < ActiveRecord::Base
  has_and_belongs_to_many :animes
  has_and_belongs_to_many :mangas
end
