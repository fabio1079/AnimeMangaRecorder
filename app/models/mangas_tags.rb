class MangasTags < ActiveRecord::Base
  belongs_to :tag
  belongs_to :manga
end
