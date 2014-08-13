class Manga < ActiveRecord::Base
  extend FriendlyId

  belongs_to :author
  has_and_belongs_to_many :tags

  friendly_id :title, use: :slugged

  validates :title,
    :presence=>true,
    :uniqueness=>true,
    :length=>{ :minimum=>3, :maximum=>80 }

  validates :volume, :chapter,
    :presence=>true,
    :length=>{ :minimum=>1, :maximum=>10 }

  validates :chapter_title,
    :length=>{ :maximum=>80 },
    :allow_blank=>true

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
