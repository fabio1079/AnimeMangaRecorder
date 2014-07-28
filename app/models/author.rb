class Author < ActiveRecord::Base
  extend FriendlyId

  has_many :animes
  has_many :mangas

  friendly_id :name, use: :slugged

  validates :name,
    :presence=>true,
    :uniqueness=>true,
    :length=>{ :minimum=>2, :maximum=>80 }
end
