class Author < ActiveRecord::Base
  extend FriendlyId

  has_many :animes
  has_many :mangas

  friendly_id :name, use: :slugged
end
