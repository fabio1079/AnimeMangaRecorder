require "rails_helper"

RSpec.describe Author, :type => :model do
  describe 'should_generate_new_friendly_id' do
    it 'should generate a new friendly url if the slug is blank' do
      author = Author::new :name=>"Fulano Ciclano"

      expect(author.should_generate_new_friendly_id?).to be(true)
      author.save!
      expect(author.should_generate_new_friendly_id?).to be(false)
    end

    it 'should generate a new friendly url if the name changed' do
      author = Author::new :name=>"Fulano Ciclano"
      author.save!

      expect(author.should_generate_new_friendly_id?).to be(false)
      author.name = "Another Name"
      expect(author.should_generate_new_friendly_id?).to be(true)
    end
  end
end