class Tag < ActiveRecord::Base
  extend FriendlyId

  has_and_belongs_to_many :animes
  has_and_belongs_to_many :mangas

  friendly_id :name, use: :slugged

  validates :name,
    :presence=>true,
    :uniqueness=>true,
    :length=>{ :minimum=>2, :maximum=>12 }
end
