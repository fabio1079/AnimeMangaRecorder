class Tag < ActiveRecord::Base
  extend FriendlyId

  has_and_belongs_to_many :animes
  has_and_belongs_to_many :mangas

  friendly_id :name, use: :slugged
end
