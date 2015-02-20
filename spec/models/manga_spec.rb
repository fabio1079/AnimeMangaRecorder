require "rails_helper"

RSpec.describe Manga, :type => :model do
  describe 'should_generate_new_friendly_id' do
    it 'should generate a new friendly url if the slug is blank' do
      manga = Manga::new title:"Just a manga title", volume:"1", chapter:"1"

      expect(manga.should_generate_new_friendly_id?).to be(true)
      manga.save!
      expect(manga.should_generate_new_friendly_id?).to be(false)
    end

    it 'should generate a new friendly url if the name changed' do
      manga = Manga::new title:"Just a manga title", volume:"1", chapter:"1"
      manga.save!

      expect(manga.should_generate_new_friendly_id?).to be(false)
      manga.title = "Another title"
      expect(manga.should_generate_new_friendly_id?).to be(true)
    end
  end
end
