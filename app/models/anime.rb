class Anime < ActiveRecord::Base
  extend FriendlyId

  belongs_to :author
  has_and_belongs_to_many :tags

  friendly_id :title, use: :slugged
end
